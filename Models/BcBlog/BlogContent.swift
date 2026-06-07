/// ブログコンテンツモデル
public struct BlogContent: Codable {
    public let id: Int
    public let description: String?
    public let template: String?
    public let listCount: Int?
    public let listDirection: String?
    public let feedCount: Int?
    public let tagUse: Bool?
    public let commentUse: Bool?
    public let commentApprove: Bool?
    public let authCaptcha: Bool?
    public let widgetArea: Int?
    public let eyeCatchSize: String?
    public let useContent: Bool?
    public let created: String?
    public let modified: String?
    public let content: ContentDetail?

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
public typealias BlogContentDetail = ContentDetail
public typealias BlogSite = SiteDetail
