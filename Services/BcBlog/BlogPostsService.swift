import Foundation

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

    /// ブログ記事を追加する
    /// - Parameter request: 追加するブログ記事の情報
    /// - Returns: 追加したブログ記事
    func addBlogPost(_ request: BlogPostAddRequest) async throws -> BlogPost {
        // アイキャッチ画像があれば multipart/form-data で送信する
        let files = request.eyeCatch.map {
            [(name: "eye_catch", data: $0.data, fileName: $0.fileName, mimeType: $0.mimeType)]
        } ?? []
        let res: BlogPostAddResponse = try await client.add(route: .blogPosts, data: request, files: files)
        guard let blogPost = res.blogPost else {
            throw BcError.notFound(resource: "ブログ記事", identifier: request.title)
        }
        return blogPost
    }

    /// ブログ記事を編集する
    /// - Parameters:
    ///   - id: ブログ記事 ID
    ///   - request: 編集するブログ記事の情報
    /// - Returns: 編集したブログ記事
    func editBlogPost(id: Int, _ request: BlogPostEditRequest) async throws -> BlogPost {
        let files = request.eyeCatch.map {
            [(name: "eye_catch", data: $0.data, fileName: $0.fileName, mimeType: $0.mimeType)]
        } ?? []
        let res: BlogPostEditResponse = try await client.edit(route: .blogPosts, id: id, data: request, files: files)
        guard let blogPost = res.blogPost else {
            throw BcError.notFound(resource: "ブログ記事", identifier: String(id))
        }
        return blogPost
    }

    /// ブログ記事を削除する
    /// - Parameter id: ブログ記事 ID
    func deleteBlogPost(id: Int) async throws {
        try await client.delete(route: .blogPosts, id: id)
    }
}
