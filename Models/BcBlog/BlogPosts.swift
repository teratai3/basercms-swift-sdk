/// ブログ記事モデル
public struct BlogPost: Codable {
    public let id: Int
    public let blogContentId: Int
    public let no: Int
    public let name: String?
    public let title: String
    public let content: String?
    public let detail: String?
    public let blogCategoryId: Int?
    public let userId: Int
    public let status: Bool
    public let posted: String?
    public let contentDraft: String?
    public let detailDraft: String?
    public let publishBegin: String?
    public let publishEnd: String?
    public let excludeSearch: Bool?
    public let eyeCatch: String?
    public let created: String?
    public let modified: String?
    public let blogTags: [BlogTag]?
    public let blogCategory: BlogCategory?
    public let blogContent: BlogContent?

    enum CodingKeys: String, CodingKey {
        case id, no, name, title, content, detail, status, posted, created, modified
        case blogContentId = "blog_content_id"
        case blogCategoryId = "blog_category_id"
        case userId = "user_id"
        case contentDraft = "content_draft"
        case detailDraft = "detail_draft"
        case publishBegin = "publish_begin"
        case publishEnd = "publish_end"
        case excludeSearch = "exclude_search"
        case eyeCatch = "eye_catch"
        case blogTags = "blog_tags"
        case blogCategory = "blog_category"
        case blogContent = "blog_content"
    }
}
