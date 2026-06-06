import Foundation

/// GET .../blog_categories/index.json のレスポンス
struct BlogCategoriesIndexResponse: Decodable {
    let blogCategories: [BlogCategory]?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogCategories = "blogCategories"
        case message
    }
}

/// GET .../blog_categories/view/{id}.json のレスポンス
struct BlogCategoryViewResponse: Decodable {
    let blogCategory: BlogCategory?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogCategory = "blogCategory"
        case message
    }
}

/// POST .../blog_categories/add.json のリクエスト
struct BlogCategoryAddRequest: Encodable {
    let name: String
    let blogContentId: Int
    let title: String?
    let parentId: Int?

    enum CodingKeys: String, CodingKey {
        case name, title
        case blogContentId = "blog_content_id"
        case parentId = "parent_id"
    }
}

/// POST .../blog_categories/add.json のレスポンス
struct BlogCategoryAddResponse: Decodable {
    let blogCategory: BlogCategory?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogCategory = "blogCategory"
        case message
    }
}

/// POST .../blog_categories/edit/{id}.json のリクエスト
struct BlogCategoryEditRequest: Encodable {
    let name: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case name, title
    }
}

/// POST .../blog_categories/edit/{id}.json のレスポンス
struct BlogCategoryEditResponse: Decodable {
    let blogCategory: BlogCategory?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogCategory = "blogCategory"
        case message
    }
}
