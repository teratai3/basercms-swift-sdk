/// カスタムリンクモデル
struct CustomLink: Codable {
    let id: Int
    let customTableId: Int?
    let customFieldId: Int?
    let no: Int?
    let parentId: Int?
    let level: Int?
    let lft: Int?
    let rght: Int?
    let name: String?
    let title: String?
    let beforeHead: String?
    let afterHead: String?
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
    let created: String?
    let modified: String?
    let customField: CustomField?

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
