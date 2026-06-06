/// カスタムエントリーモデル
struct CustomEntry: Codable {
    let id: Int
    let customTableId: Int?
    let name: String?
    let title: String?
    let parentId: Int?
    let lft: Int?
    let rght: Int?
    let level: Int?
    let status: Bool?
    let publishBegin: String?
    let publishEnd: String?
    let published: String?
    let creatorId: Int?
    let created: String?
    let modified: String?

    enum CodingKeys: String, CodingKey {
        case id, name, title, lft, rght, level, status, published, created, modified
        case customTableId = "custom_table_id"
        case parentId = "parent_id"
        case publishBegin = "publish_begin"
        case publishEnd = "publish_end"
        case creatorId = "creator_id"
    }
}
