/// ブログ記事関連の API を扱うサービス
struct BlogPostsService {
    let client: ApiClient

    /// ブログ記事一覧を取得する
    /// - Returns: ブログ記事の配列（該当なしの場合は空配列）
    func getBlogPosts() async throws -> [BlogPost] {
        let res: BlogPostsIndexResponse = try await client.getIndex(route: .blogPosts)
        return res.blogPosts ?? []
    }
}