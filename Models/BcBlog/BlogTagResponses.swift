import Foundation

/// GET .../blog_tags/index.json のレスポンス
struct BlogTagsIndexResponse: Decodable {
    let blogTags: [BlogTag]?
    let message: String?
}

/// GET .../blog_tags/view/{id}.json のレスポンス
struct BlogTagViewResponse: Decodable {
    let blogTag: BlogTag?
    let message: String?
}

/// POST .../blog_tags/add.json のリクエスト
struct BlogTagAddRequest: Encodable {
    let name: String
}

/// POST .../blog_tags/add.json のレスポンス
struct BlogTagAddResponse: Decodable {
    let blogTag: BlogTag?
    let message: String?
}

/// POST .../blog_tags/edit/{id}.json のリクエスト
struct BlogTagEditRequest: Encodable {
    let name: String
}

/// POST .../blog_tags/edit/{id}.json のレスポンス
struct BlogTagEditResponse: Decodable {
    let blogTag: BlogTag?
    let message: String?
}
