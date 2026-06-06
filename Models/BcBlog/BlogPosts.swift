/// ブログ記事モデル
struct BlogPost: Codable {
    let id: Int
    let blogContentId: Int
    let no: Int
    let name: String?
    let title: String
    let content: String?
    let detail: String?
    let blogCategoryId: Int?
    let userId: Int
    let status: Bool
    let posted: String?
    let contentDraft: String?
    let detailDraft: String?
    let publishBegin: String?
    let publishEnd: String?
    let excludeSearch: Bool?
    let eyeCatch: String?
    let created: String?
    let modified: String?
    let blogTags: [BlogTag]?
    let blogCategory: BlogCategory?
    let blogContent: BlogContent?

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
