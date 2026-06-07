import Foundation

/// GET .../custom_contents/index.json のレスポンス
struct CustomContentsIndexResponse: Decodable {
    let customContents: [CustomContent]?
    let message: String?
}

/// GET .../custom_contents/view/{id}.json のレスポンス
struct CustomContentViewResponse: Decodable {
    let customContent: CustomContent?
    let message: String?
}

/// POST .../custom_contents/add.json の content ネストオブジェクト
/// JS SDK が content.status を content.self_status に変換するため selfStatus を使用する
public struct CustomContentAddContentRequest: Encodable {
    public let title: String
    public let name: String
    public let siteId: Int
    public let parentId: Int?
    public let selfStatus: Bool

    enum CodingKeys: String, CodingKey {
        case title, name
        case siteId = "site_id"
        case parentId = "parent_id"
        case selfStatus = "self_status"
    }

    /// コンストラクタ
    public init(
        title: String,
        name: String,
        siteId: Int,
        parentId: Int? = nil,
        selfStatus: Bool
    ) {
        self.title = title
        self.name = name
        self.siteId = siteId
        self.parentId = parentId
        self.selfStatus = selfStatus
    }
}

/// POST .../custom_contents/add.json のリクエスト
public struct CustomContentAddRequest: Encodable {
    public let customTableId: Int
    public let content: CustomContentAddContentRequest
    public let description: String?
    public let template: String?
    public let widgetArea: Int?
    public let listCount: Int?
    public let listOrder: String?
    public let listDirection: String?

    enum CodingKeys: String, CodingKey {
        case content, description, template
        case customTableId = "custom_table_id"
        case widgetArea = "widget_area"
        case listCount = "list_count"
        case listOrder = "list_order"
        case listDirection = "list_direction"
    }

    /// コンストラクタ
    public init(
        customTableId: Int,
        content: CustomContentAddContentRequest,
        description: String? = nil,
        template: String? = nil,
        widgetArea: Int? = nil,
        listCount: Int? = nil,
        listOrder: String? = nil,
        listDirection: String? = nil
    ) {
        self.customTableId = customTableId
        self.content = content
        self.description = description
        self.template = template
        self.widgetArea = widgetArea
        self.listCount = listCount
        self.listOrder = listOrder
        self.listDirection = listDirection
    }
}

/// POST .../custom_contents/add.json のレスポンス
struct CustomContentAddResponse: Decodable {
    let customContent: CustomContent?
    let message: String?
}

/// POST .../custom_contents/edit/{id}.json の content ネストオブジェクト
public struct CustomContentEditContentRequest: Encodable {
    public let title: String?
    public let selfStatus: Bool?

    enum CodingKeys: String, CodingKey {
        case title
        case selfStatus = "self_status"
    }

    /// コンストラクタ
    public init(
        title: String? = nil,
        selfStatus: Bool? = nil
    ) {
        self.title = title
        self.selfStatus = selfStatus
    }
}

/// POST .../custom_contents/edit/{id}.json のリクエスト
public struct CustomContentEditRequest: Encodable {
    public let content: CustomContentEditContentRequest?
    public let description: String?
    public let template: String?
    public let listCount: Int?
    public let listOrder: String?
    public let listDirection: String?

    enum CodingKeys: String, CodingKey {
        case content, description, template
        case listCount = "list_count"
        case listOrder = "list_order"
        case listDirection = "list_direction"
    }

    /// コンストラクタ
    public init(
        content: CustomContentEditContentRequest? = nil,
        description: String? = nil,
        template: String? = nil,
        listCount: Int? = nil,
        listOrder: String? = nil,
        listDirection: String? = nil
    ) {
        self.content = content
        self.description = description
        self.template = template
        self.listCount = listCount
        self.listOrder = listOrder
        self.listDirection = listDirection
    }
}

/// POST .../custom_contents/edit/{id}.json のレスポンス
struct CustomContentEditResponse: Decodable {
    let customContent: CustomContent?
    let message: String?
}
