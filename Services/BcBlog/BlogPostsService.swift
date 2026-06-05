/// ブログ記事関連の API を扱うサービス
struct BlogPostsService {
    let client: ApiClient

    /// ブログ記事一覧を取得する
    /// - Returns: ブログ記事の配列（該当なしの場合は空配列）
    func getBlogPosts() async throws -> [BlogPost] {
        let res: BlogPostsIndexResponse = try await client.getIndex(route: .blogPosts)
        return res.blogPosts ?? []
    }

    /// 単一ブログ記事を取得する
    /// - Parameter id: ブログ記事 ID
    /// - Returns: 該当するブログ記事
    func getBlogPost(id: Int) async throws -> BlogPost {
        let res: BlogPostViewResponse = try await client.getView(route: .blogPosts, id: id)
        guard let blogPost = res.blogPost else {
            throw BcError.notFound(resource: "ブログ記事", identifier: String(id))
        }
        return blogPost
    }
}
