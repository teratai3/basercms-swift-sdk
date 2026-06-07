import Foundation

/// GET .../blog_contents/index.json のレスポンス
public struct BlogContentsIndexResponse: Decodable {
    public let blogContents: [BlogContent]?
    public let message: String?
}

/// GET .../blog_contents/view/{id}.json のレスポンス
public struct BlogContentViewResponse: Decodable {
    public let blogContent: BlogContent?
    public let message: String?
}

/// POST .../blog_contents/add.json の content ネストオブジェクト
/// Content エンティティの必須フィールド（title・name・site_id・parent_id）を含む
public struct BlogContentAddContentRequest: Encodable {
    public let title: String
    public let name: String
    public let siteId: Int
    public let parentId: Int?

    enum CodingKeys: String, CodingKey {
        case title, name
        case siteId = "site_id"
        case parentId = "parent_id"
    }

    /// コンストラクタ
    public init(
        title: String,
        name: String,
        siteId: Int,
        parentId: Int? = nil
    ) {
        self.title = title
        self.name = name
        self.siteId = siteId
        self.parentId = parentId
    }
}

/// POST .../blog_contents/add.json のリクエスト
public struct BlogContentAddRequest: Encodable {
    public let content: BlogContentAddContentRequest
    public let description: String?
    public let template: String?
    public let listCount: Int?
    public let listDirection: String?
    public let feedCount: Int?
    public let tagUse: Bool
    public let commentUse: Bool
    public let commentApprove: Bool
    public let widgetArea: Int?
    public let eyeCatchSize: String?
    public let useContent: Bool

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

    /// コンストラクタ
    public init(
        content: BlogContentAddContentRequest,
        description: String? = nil,
        template: String? = nil,
        listCount: Int? = nil,
        listDirection: String? = nil,
        feedCount: Int? = nil,
        tagUse: Bool,
        commentUse: Bool,
        commentApprove: Bool,
        widgetArea: Int? = nil,
        eyeCatchSize: String? = nil,
        useContent: Bool
    ) {
        self.content = content
        self.description = description
        self.template = template
        self.listCount = listCount
        self.listDirection = listDirection
        self.feedCount = feedCount
        self.tagUse = tagUse
        self.commentUse = commentUse
        self.commentApprove = commentApprove
        self.widgetArea = widgetArea
        self.eyeCatchSize = eyeCatchSize
        self.useContent = useContent
    }
}

/// POST .../blog_contents/add.json のレスポンス
public struct BlogContentAddResponse: Decodable {
    public let blogContent: BlogContent?
    public let message: String?
}

/// POST .../blog_contents/edit/{id}.json のリクエスト
public struct BlogContentEditRequest: Encodable {
    public let description: String?
    public let template: String?
    public let listCount: Int?
    public let listDirection: String?
    public let feedCount: Int?
    public let tagUse: Bool?
    public let commentUse: Bool?
    public let commentApprove: Bool?
    public let widgetArea: Int?
    public let eyeCatchSize: String?
    public let useContent: Bool?

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

    /// コンストラクタ
    public init(
        description: String? = nil,
        template: String? = nil,
        listCount: Int? = nil,
        listDirection: String? = nil,
        feedCount: Int? = nil,
        tagUse: Bool? = nil,
        commentUse: Bool? = nil,
        commentApprove: Bool? = nil,
        widgetArea: Int? = nil,
        eyeCatchSize: String? = nil,
        useContent: Bool? = nil
    ) {
        self.description = description
        self.template = template
        self.listCount = listCount
        self.listDirection = listDirection
        self.feedCount = feedCount
        self.tagUse = tagUse
        self.commentUse = commentUse
        self.commentApprove = commentApprove
        self.widgetArea = widgetArea
        self.eyeCatchSize = eyeCatchSize
        self.useContent = useContent
    }
}

/// POST .../blog_contents/edit/{id}.json のレスポンス
public struct BlogContentEditResponse: Decodable {
    public let blogContent: BlogContent?
    public let message: String?
}
