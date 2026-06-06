import Foundation

/// ブログコンテンツ関連の API を扱うサービス
struct BlogContentsService {
    let client: ApiClient

    /// ブログコンテンツ一覧を取得する
    /// - Returns: ブログコンテンツの配列（該当なしの場合は空配列）
    func getBlogContents() async throws -> [BlogContent] {
        let res: BlogContentsIndexResponse = try await client.getIndex(route: .blogContents)
        return res.blogContents ?? []
    }

    /// 単一ブログコンテンツを取得する
    /// - Parameter id: ブログコンテンツ ID
    /// - Returns: 該当するブログコンテンツ
    func getBlogContent(id: Int) async throws -> BlogContent {
        let res: BlogContentViewResponse = try await client.getView(route: .blogContents, id: id)
        guard let blogContent = res.blogContent else {
            throw BcError.notFound(resource: "ブログコンテンツ", identifier: String(id))
        }
        return blogContent
    }

    /// ブログコンテンツを追加する
    /// - Parameter request: 追加するブログコンテンツの情報
    /// - Returns: 追加したブログコンテンツ
    func addBlogContent(_ request: BlogContentAddRequest) async throws -> BlogContent {
        let res: BlogContentAddResponse = try await client.add(route: .blogContents, data: request)
        guard let blogContent = res.blogContent else {
            throw BcError.notFound(resource: "ブログコンテンツ", identifier: request.description ?? "")
        }
        return blogContent
    }

    /// ブログコンテンツを編集する
    /// - Parameters:
    ///   - id: ブログコンテンツ ID
    ///   - request: 編集するブログコンテンツの情報
    /// - Returns: 編集したブログコンテンツ
    func editBlogContent(id: Int, _ request: BlogContentEditRequest) async throws -> BlogContent {
        let res: BlogContentEditResponse = try await client.edit(route: .blogContents, id: id, data: request)
        guard let blogContent = res.blogContent else {
            throw BcError.notFound(resource: "ブログコンテンツ", identifier: String(id))
        }
        return blogContent
    }

    /// ブログコンテンツを削除する
    /// - Parameter id: ブログコンテンツ ID
    func deleteBlogContent(id: Int) async throws {
        try await client.delete(route: .blogContents, id: id)
    }
}
