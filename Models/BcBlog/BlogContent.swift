/// ブログコンテンツモデル
struct BlogContent: Codable {
    let id: Int
    let description: String?
    let template: String?
    let listCount: Int?
    let listDirection: String?
    let feedCount: Int?
    let tagUse: Bool?
    let commentUse: Bool?
    let commentApprove: Bool?
    let authCaptcha: Bool?
    let widgetArea: Int?
    let eyeCatchSize: String?
    let useContent: Bool?
    let created: String?
    let modified: String?
    let content: ContentDetail?

    enum CodingKeys: String, CodingKey {
        case id, description, template, created, modified, content
        case listCount = "list_count"
        case listDirection = "list_direction"
        case feedCount = "feed_count"
        case tagUse = "tag_use"
        case commentUse = "comment_use"
        case commentApprove = "comment_approve"
        case authCaptcha = "auth_captcha"
        case widgetArea = "widget_area"
        case eyeCatchSize = "eye_catch_size"
        case useContent = "use_content"
    }
}

/// 後方互換のための typealias（実体は BaserCore の ContentDetail）
typealias BlogContentDetail = ContentDetail
typealias BlogSite = SiteDetail
