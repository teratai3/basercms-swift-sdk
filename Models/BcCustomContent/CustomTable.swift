/// カスタムテーブルモデル
struct CustomTable: Codable {
    let id: Int
    let type: String?
    let name: String?
    let title: String?
    let displayField: String?
    let hasChild: Bool?
    let created: String?
    let modified: String?

    enum CodingKeys: String, CodingKey {
        case id, type, name, title, created, modified
        case displayField = "display_field"
        case hasChild = "has_child"
    }
}
