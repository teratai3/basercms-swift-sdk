import Foundation

/// GET .../blog_contents/index.json のレスポンス
struct BlogContentsIndexResponse: Decodable {
    let blogContents: [BlogContent]?
    let message: String?
}

/// GET .../blog_contents/view/{id}.json のレスポンス
struct BlogContentViewResponse: Decodable {
    let blogContent: BlogContent?
    let message: String?
}

/// POST .../blog_contents/add.json の content ネストオブジェクト
/// Content エンティティの必須フィールド（title・name・site_id・parent_id）を含む
struct BlogContentAddContentRequest: Encodable {
    let title: String
    let name: String
    let siteId: Int
    let parentId: Int?

    enum CodingKeys: String, CodingKey {
        case title, name
        case siteId = "site_id"
        case parentId = "parent_id"
    }
}

/// POST .../blog_contents/add.json のリクエスト
struct BlogContentAddRequest: Encodable {
    let content: BlogContentAddContentRequest
    let description: String?
    let template: String?
    let listCount: Int?
    let listDirection: String?
    let feedCount: Int?
    let tagUse: Bool
    let commentUse: Bool
    let commentApprove: Bool
    let widgetArea: Int?
    let eyeCatchSize: String?
    let useContent: Bool

    enum CodingKeys: String, CodingKey {
        case content, description, template
        case listCount = "list_count"
        case listDirection = "list_direction"
        case feedCount = "feed_count"
        case tagUse = "tag_use"
        case commentUse = "comment_use"
        case commentApprove = "comment_approve"
        case widgetArea = "widget_area"
        case eyeCatchSize = "eye_catch_size"
        case useContent = "use_content"
    }
}

/// POST .../blog_contents/add.json のレスポンス
struct BlogContentAddResponse: Decodable {
    let blogContent: BlogContent?
    let message: String?
}

/// POST .../blog_contents/edit/{id}.json のリクエスト
struct BlogContentEditRequest: Encodable {
    let description: String?
    let template: String?
    let listCount: Int?
    let listDirection: String?
    let feedCount: Int?
    let tagUse: Bool?
    let commentUse: Bool?
    let commentApprove: Bool?
    let widgetArea: Int?
    let eyeCatchSize: String?
    let useContent: Bool?

    enum CodingKeys: String, CodingKey {
        case description, template
        case listCount = "list_count"
        case listDirection = "list_direction"
        case feedCount = "feed_count"
        case tagUse = "tag_use"
        case commentUse = "comment_use"
        case commentApprove = "comment_approve"
        case widgetArea = "widget_area"
        case eyeCatchSize = "eye_catch_size"
        case useContent = "use_content"
    }
}

/// POST .../blog_contents/edit/{id}.json のレスポンス
struct BlogContentEditResponse: Decodable {
    let blogContent: BlogContent?
    let message: String?
}
