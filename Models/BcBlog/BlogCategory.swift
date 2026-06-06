/// ブログカテゴリモデル
struct BlogCategory: Codable {
    let id: Int
    let blogContentId: Int
    let no: Int
    let name: String
    let title: String?
    let status: Bool?
    let parentId: Int?
    let lft: Int?
    let rght: Int?
    let created: String?
    let modified: String?

    enum CodingKeys: String, CodingKey {
        case id, no, name, title, status, lft, rght, created, modified
        case blogContentId = "blog_content_id"
        case parentId = "parent_id"
    }
}
