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
public struct CustomLinkAddRequest: Encodable {
    public let customTableId: Int
    public let customFieldId: Int
    public let name: String
    public let title: String
    public let no: Int?
    public let parentId: Int?
    public let level: Int?
    public let lft: Int?
    public let rght: Int?
    public let description: String?
    public let attention: String?
    public let options: String?
    public let cssClass: String?
    public let groupValid: Bool?
    public let beforeLinefeed: Bool?
    public let afterLinefeed: Bool?
    public let useLoop: Bool?
    public let displayAdminList: Bool?
    public let displayFront: Bool?
    public let searchTargetAdmin: Bool?
    public let searchTargetFront: Bool?
    public let useApi: Bool?
    public let required: Bool?
    public let status: Bool

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

    /// コンストラクタ
    public init(
        customTableId: Int,
        customFieldId: Int,
        name: String,
        title: String,
        no: Int? = nil,
        parentId: Int? = nil,
        level: Int? = nil,
        lft: Int? = nil,
        rght: Int? = nil,
        description: String? = nil,
        attention: String? = nil,
        options: String? = nil,
        cssClass: String? = nil,
        groupValid: Bool? = nil,
        beforeLinefeed: Bool? = nil,
        afterLinefeed: Bool? = nil,
        useLoop: Bool? = nil,
        displayAdminList: Bool? = nil,
        displayFront: Bool? = nil,
        searchTargetAdmin: Bool? = nil,
        searchTargetFront: Bool? = nil,
        useApi: Bool? = nil,
        required: Bool? = nil,
        status: Bool
    ) {
        self.customTableId = customTableId
        self.customFieldId = customFieldId
        self.name = name
        self.title = title
        self.no = no
        self.parentId = parentId
        self.level = level
        self.lft = lft
        self.rght = rght
        self.description = description
        self.attention = attention
        self.options = options
        self.cssClass = cssClass
        self.groupValid = groupValid
        self.beforeLinefeed = beforeLinefeed
        self.afterLinefeed = afterLinefeed
        self.useLoop = useLoop
        self.displayAdminList = displayAdminList
        self.displayFront = displayFront
        self.searchTargetAdmin = searchTargetAdmin
        self.searchTargetFront = searchTargetFront
        self.useApi = useApi
        self.required = required
        self.status = status
    }
}

/// POST .../custom_links/add.json のレスポンス
struct CustomLinkAddResponse: Decodable {
    let customLink: CustomLink?
    let message: String?
}

/// POST .../custom_links/edit/{id}.json のリクエスト
public struct CustomLinkEditRequest: Encodable {
    public let name: String?
    public let title: String?
    public let no: Int?
    public let parentId: Int?
    public let description: String?
    public let attention: String?
    public let options: String?
    public let cssClass: String?
    public let groupValid: Bool?
    public let beforeLinefeed: Bool?
    public let afterLinefeed: Bool?
    public let useLoop: Bool?
    public let displayAdminList: Bool?
    public let displayFront: Bool?
    public let searchTargetAdmin: Bool?
    public let searchTargetFront: Bool?
    public let useApi: Bool?
    public let required: Bool?
    public let status: Bool?

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

    /// コンストラクタ
    public init(
        name: String? = nil,
        title: String? = nil,
        no: Int? = nil,
        parentId: Int? = nil,
        description: String? = nil,
        attention: String? = nil,
        options: String? = nil,
        cssClass: String? = nil,
        groupValid: Bool? = nil,
        beforeLinefeed: Bool? = nil,
        afterLinefeed: Bool? = nil,
        useLoop: Bool? = nil,
        displayAdminList: Bool? = nil,
        displayFront: Bool? = nil,
        searchTargetAdmin: Bool? = nil,
        searchTargetFront: Bool? = nil,
        useApi: Bool? = nil,
        required: Bool? = nil,
        status: Bool? = nil
    ) {
        self.name = name
        self.title = title
        self.no = no
        self.parentId = parentId
        self.description = description
        self.attention = attention
        self.options = options
        self.cssClass = cssClass
        self.groupValid = groupValid
        self.beforeLinefeed = beforeLinefeed
        self.afterLinefeed = afterLinefeed
        self.useLoop = useLoop
        self.displayAdminList = displayAdminList
        self.displayFront = displayFront
        self.searchTargetAdmin = searchTargetAdmin
        self.searchTargetFront = searchTargetFront
        self.useApi = useApi
        self.required = required
        self.status = status
    }
}

/// POST .../custom_links/edit/{id}.json のレスポンス
struct CustomLinkEditResponse: Decodable {
    let customLink: CustomLink?
    let message: String?
}
