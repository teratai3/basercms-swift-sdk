/// カスタムリンクモデル
public struct CustomLink: Codable {
    public let id: Int
    public let customTableId: Int?
    public let customFieldId: Int?
    public let no: Int?
    public let parentId: Int?
    public let level: Int?
    public let lft: Int?
    public let rght: Int?
    public let name: String?
    public let title: String?
    public let beforeHead: String?
    public let afterHead: String?
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
    public let created: String?
    public let modified: String?
    public let customField: CustomField?

    enum CodingKeys: String, CodingKey {
        case id, no, name, title, description, attention, options, required, status, created, modified
        case customTableId = "custom_table_id"
        case customFieldId = "custom_field_id"
        case parentId = "parent_id"
        case level, lft, rght
        case beforeHead = "before_head"
        case afterHead = "after_head"
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
        case customField = "custom_field"
    }
}
