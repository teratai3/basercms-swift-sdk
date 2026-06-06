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
struct CustomContentAddContentRequest: Encodable {
    let title: String
    let name: String
    let siteId: Int
    let parentId: Int?
    let selfStatus: Bool

    enum CodingKeys: String, CodingKey {
        case title, name
        case siteId = "site_id"
        case parentId = "parent_id"
        case selfStatus = "self_status"
    }
}

/// POST .../custom_contents/add.json のリクエスト
struct CustomContentAddRequest: Encodable {
    let customTableId: Int
    let content: CustomContentAddContentRequest
    let description: String?
    let template: String?
    let widgetArea: Int?
    let listCount: Int?
    let listOrder: String?
    let listDirection: String?

    enum CodingKeys: String, CodingKey {
        case content, description, template
        case customTableId = "custom_table_id"
        case widgetArea = "widget_area"
        case listCount = "list_count"
        case listOrder = "list_order"
        case listDirection = "list_direction"
    }
}

/// POST .../custom_contents/add.json のレスポンス
struct CustomContentAddResponse: Decodable {
    let customContent: CustomContent?
    let message: String?
}

/// POST .../custom_contents/edit/{id}.json の content ネストオブジェクト
struct CustomContentEditContentRequest: Encodable {
    let title: String?
    let selfStatus: Bool?

    enum CodingKeys: String, CodingKey {
        case title
        case selfStatus = "self_status"
    }
}

/// POST .../custom_contents/edit/{id}.json のリクエスト
struct CustomContentEditRequest: Encodable {
    let content: CustomContentEditContentRequest?
    let description: String?
    let template: String?
    let listCount: Int?
    let listDirection: String?

    enum CodingKeys: String, CodingKey {
        case content, description, template
        case listCount = "list_count"
        case listDirection = "list_direction"
    }
}

/// POST .../custom_contents/edit/{id}.json のレスポンス
struct CustomContentEditResponse: Decodable {
    let customContent: CustomContent?
    let message: String?
}
