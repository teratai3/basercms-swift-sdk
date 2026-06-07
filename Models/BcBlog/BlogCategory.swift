/// ブログカテゴリモデル
public struct BlogCategory: Codable {
    public let id: Int
    public let blogContentId: Int
    public let no: Int
    public let name: String
    public let title: String?
    public let status: Bool?
    public let parentId: Int?
    public let lft: Int?
    public let rght: Int?
    public let created: String?
    public let modified: String?

    enum CodingKeys: String, CodingKey {
        case id, no, name, title, status, lft, rght, created, modified
        case blogContentId = "blog_content_id"
        case parentId = "parent_id"
    }
}
