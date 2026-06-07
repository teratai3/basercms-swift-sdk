import Foundation

/// ブログタグ関連の API を扱うサービス
public struct BlogTagsService {
    private let client: ApiClient

    /// コンストラクタ
    public init(client: ApiClient) {
        self.client = client
    }

    /// ブログタグ一覧を取得する
    /// - Returns: ブログタグの配列（該当なしの場合は空配列）
    public func getBlogTags() async throws -> [BlogTag] {
        let res: BlogTagsIndexResponse = try await client.getIndex(route: .blogTags)
        return res.blogTags ?? []
    }

    /// 単一ブログタグを取得する
    /// - Parameter id: ブログタグ ID
    /// - Returns: 該当するブログタグ
    public func getBlogTag(id: Int) async throws -> BlogTag {
        let res: BlogTagViewResponse = try await client.getView(route: .blogTags, id: id)
        guard let blogTag = res.blogTag else {
            throw BcError.notFound(resource: "ブログタグ", identifier: String(id))
        }
        return blogTag
    }

    /// ブログタグを追加する
    /// - Parameter request: 追加するブログタグの情報
    /// - Returns: 追加したブログタグ
    public func addBlogTag(_ request: BlogTagAddRequest) async throws -> BlogTag {
        let res: BlogTagAddResponse = try await client.add(route: .blogTags, data: request)
        guard let blogTag = res.blogTag else {
            throw BcError.notFound(resource: "ブログタグ", identifier: request.name)
        }
        return blogTag
    }

    /// ブログタグを編集する
    /// - Parameters:
    ///   - id: ブログタグ ID
    ///   - request: 編集するブログタグの情報
    /// - Returns: 編集したブログタグ
    public func editBlogTag(id: Int, _ request: BlogTagEditRequest) async throws -> BlogTag {
        let res: BlogTagEditResponse = try await client.edit(route: .blogTags, id: id, data: request)
        guard let blogTag = res.blogTag else {
            throw BcError.notFound(resource: "ブログタグ", identifier: String(id))
        }
        return blogTag
    }

    /// ブログタグを削除する
    /// - Parameter id: ブログタグ ID
    public func deleteBlogTag(id: Int) async throws {
        try await client.delete(route: .blogTags, id: id)
    }
}
