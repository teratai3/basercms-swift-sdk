/// カスタムテーブルモデル
public struct CustomTable: Codable {
    public let id: Int
    public let type: String?
    public let name: String?
    public let title: String?
    public let displayField: String?
    public let hasChild: Bool?
    public let created: String?
    public let modified: String?

    enum CodingKeys: String, CodingKey {
        case id, type, name, title, created, modified
        case displayField = "display_field"
        case hasChild = "has_child"
    }
}
