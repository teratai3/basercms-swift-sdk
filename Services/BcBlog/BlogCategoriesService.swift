import Foundation

/// ブログカテゴリ関連の API を扱うサービス
struct BlogCategoriesService {
    let client: ApiClient

    /// ブログカテゴリ一覧を取得する
    /// - Parameter blogContentId: ブログコンテンツ ID
    /// - Returns: ブログカテゴリの配列（該当なしの場合は空配列）
    func getBlogCategories(blogContentId: Int) async throws -> [BlogCategory] {
        let res: BlogCategoriesIndexResponse = try await client.getIndex(
            route: .blogCategories,
            query: ["blog_content_id": String(blogContentId)]
        )
        return res.blogCategories ?? []
    }

    /// 単一ブログカテゴリを取得する
    /// - Parameter id: ブログカテゴリ ID
    /// - Returns: 該当するブログカテゴリ
    func getBlogCategory(id: Int) async throws -> BlogCategory {
        let res: BlogCategoryViewResponse = try await client.getView(route: .blogCategories, id: id)
        guard let blogCategory = res.blogCategory else {
            throw BcError.notFound(resource: "ブログカテゴリ", identifier: String(id))
        }
        return blogCategory
    }

    /// ブログカテゴリを追加する
    /// - Parameter request: 追加するブログカテゴリの情報
    /// - Returns: 追加したブログカテゴリ
    func addBlogCategory(_ request: BlogCategoryAddRequest) async throws -> BlogCategory {
        let res: BlogCategoryAddResponse = try await client.add(route: .blogCategories, data: request)
        guard let blogCategory = res.blogCategory else {
            throw BcError.notFound(resource: "ブログカテゴリ", identifier: request.name)
        }
        return blogCategory
    }

    /// ブログカテゴリを編集する
    /// - Parameters:
    ///   - id: ブログカテゴリ ID
    ///   - request: 編集するブログカテゴリの情報
    /// - Returns: 編集したブログカテゴリ
    func editBlogCategory(id: Int, _ request: BlogCategoryEditRequest) async throws -> BlogCategory {
        let res: BlogCategoryEditResponse = try await client.edit(route: .blogCategories, id: id, data: request)
        guard let blogCategory = res.blogCategory else {
            throw BcError.notFound(resource: "ブログカテゴリ", identifier: String(id))
        }
        return blogCategory
    }

    /// ブログカテゴリを削除する
    /// - Parameter id: ブログカテゴリ ID
    func deleteBlogCategory(id: Int) async throws {
        try await client.delete(route: .blogCategories, id: id)
    }
}
