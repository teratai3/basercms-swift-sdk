import Foundation

/// GET .../custom_links/index.json のレスポンス
struct CustomLinksIndexResponse: Decodable {
    let customLinks: [CustomLink]?
    let message: String?
}

/// GET .../custom_links/view/{id}.json のレスポンス
struct CustomLinkViewResponse: Decodable {
    let customLink: CustomLink?
    let message: String?
}

/// POST .../custom_links/add.json のリクエスト
struct CustomLinkAddRequest: Encodable {
    let customTableId: Int
    let customFieldId: Int
    let name: String
    let title: String
    let no: Int?
    let parentId: Int?
    let level: Int?
    let lft: Int?
    let rght: Int?
    let description: String?
    let attention: String?
    let options: String?
    let cssClass: String?
    let groupValid: Bool?
    let beforeLinefeed: Bool?
    let afterLinefeed: Bool?
    let useLoop: Bool?
    let displayAdminList: Bool?
    let displayFront: Bool?
    let searchTargetAdmin: Bool?
    let searchTargetFront: Bool?
    let useApi: Bool?
    let required: Bool?
    let status: Bool

    enum CodingKeys: String, CodingKey {
        case name, title, description, attention, options, required, status
        case customTableId = "custom_table_id"
        case customFieldId = "custom_field_id"
        case no
        case parentId = "parent_id"
        case level, lft, rght
        case cssClass = "class"
        case groupValid = "group_valid"
        case beforeLinefeed = "before_linefeed"
        case afterLinefeed = "after_linefeed"
        case useLoop = "use_loop"
        case displayAdminList = "display_admin_list"
        case displayFront = "display_front"
        case searchTargetAdmin = "search_target_admin"
        case searchTargetFront = "search_target_front"
        case useApi = "use_api"
    }
}

/// POST .../custom_links/add.json のレスポンス
struct CustomLinkAddResponse: Decodable {
    let customLink: CustomLink?
    let message: String?
}

/// POST .../custom_links/edit/{id}.json のリクエスト
struct CustomLinkEditRequest: Encodable {
    let name: String?
    let title: String?
    let no: Int?
    let parentId: Int?
    let description: String?
    let attention: String?
    let options: String?
    let cssClass: String?
    let groupValid: Bool?
    let beforeLinefeed: Bool?
    let afterLinefeed: Bool?
    let useLoop: Bool?
    let displayAdminList: Bool?
    let displayFront: Bool?
    let searchTargetAdmin: Bool?
    let searchTargetFront: Bool?
    let useApi: Bool?
    let required: Bool?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case name, title, description, attention, options, required, status
        case no
        case parentId = "parent_id"
        case cssClass = "class"
        case groupValid = "group_valid"
        case beforeLinefeed = "before_linefeed"
        case afterLinefeed = "after_linefeed"
        case useLoop = "use_loop"
        case displayAdminList = "display_admin_list"
        case displayFront = "display_front"
        case searchTargetAdmin = "search_target_admin"
        case searchTargetFront = "search_target_front"
        case useApi = "use_api"
    }
}

/// POST .../custom_links/edit/{id}.json のレスポンス
struct CustomLinkEditResponse: Decodable {
    let customLink: CustomLink?
    let message: String?
}
