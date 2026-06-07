import Foundation

/// GET .../blog_categories/index.json のレスポンス
struct BlogCategoriesIndexResponse: Decodable {
    let blogCategories: [BlogCategory]?
    let message: String?
}

/// GET .../blog_categories/view/{id}.json のレスポンス
struct BlogCategoryViewResponse: Decodable {
    let blogCategory: BlogCategory?
    let message: String?
}

/// POST .../blog_categories/add.json のリクエスト
public struct BlogCategoryAddRequest: Encodable {
    public let name: String
    public let blogContentId: Int
    public let title: String?
    public let parentId: Int?

    enum CodingKeys: String, CodingKey {
        case name, title
        case blogContentId = "blog_content_id"
        case parentId = "parent_id"
    }

    /// コンストラクタ
    public init(
        name: String,
        blogContentId: Int,
        title: String? = nil,
        parentId: Int? = nil
    ) {
        self.name = name
        self.blogContentId = blogContentId
        self.title = title
        self.parentId = parentId
    }
}

/// POST .../blog_categories/add.json のレスポンス
struct BlogCategoryAddResponse: Decodable {
    let blogCategory: BlogCategory?
    let message: String?
}

/// POST .../blog_categories/edit/{id}.json のリクエスト
public struct BlogCategoryEditRequest: Encodable {
    public let id: Int
    public let blogContentId: Int
    public let name: String?
    public let title: String?

    enum CodingKeys: String, CodingKey {
        case id, name, title
        case blogContentId = "blog_content_id"
    }

    /// コンストラクタ
    public init(
        id: Int,
        blogContentId: Int,
        name: String? = nil,
        title: String? = nil
    ) {
        self.id = id
        self.blogContentId = blogContentId
        self.name = name
        self.title = title
    }
}

/// POST .../blog_categories/edit/{id}.json のレスポンス
struct BlogCategoryEditResponse: Decodable {
    let blogCategory: BlogCategory?
    let message: String?
}
