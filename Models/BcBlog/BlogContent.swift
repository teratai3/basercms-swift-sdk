/// ブログコンテンツモデル
struct BlogContent: Codable {
    let id: Int
    let description: String?
    let template: String?
    let listCount: Int?
    let listDirection: String?
    let feedCount: Int?
    let tagUse: Bool?
    let commentUse: Bool?
    let commentApprove: Bool?
    let authCaptcha: Bool?
    let widgetArea: Int?
    let eyeCatchSize: String?
    let useContent: Bool?
    let created: String?
    let modified: String?
    let content: BlogContentDetail?

    enum CodingKeys: String, CodingKey {
        case id, description, template, created, modified, content
        case listCount = "list_count"
        case listDirection = "list_direction"
        case feedCount = "feed_count"
        case tagUse = "tag_use"
        case commentUse = "comment_use"
        case commentApprove = "comment_approve"
        case authCaptcha = "auth_captcha"
        case widgetArea = "widget_area"
        case eyeCatchSize = "eye_catch_size"
        case useContent = "use_content"
    }
}

/// ブログコンテンツに紐づくコンテンツモデル
struct BlogContentDetail: Codable {
    let id: Int
    let name: String?
    let plugin: String?
    let type: String?
    let entityId: Int?
    let url: String?
    let siteId: Int?
    let aliasId: Int?
    let mainSiteContentId: Int?
    let parentId: Int?
    let lft: Int?
    let rght: Int?
    let level: Int?
    let title: String?
    let description: String?
    let eyecatch: String?
    let authorId: Int?
    let layoutTemplate: String?
    let status: Bool?
    let publishBegin: String?
    let publishEnd: String?
    let selfStatus: Bool?
    let selfPublishBegin: String?
    let selfPublishEnd: String?
    let excludeSearch: Bool?
    let createdDate: String?
    let modifiedDate: String?
    let siteRoot: Bool?
    let deletedDate: String?
    let excludeMenu: Bool?
    let blankLink: Bool?
    let created: String?
    let modified: String?
    let site: BlogSite?

    enum CodingKeys: String, CodingKey {
        case id, name, plugin, type, url, level, title, description, eyecatch, status, created, modified, site, lft, rght
        case entityId = "entity_id"
        case siteId = "site_id"
        case aliasId = "alias_id"
        case mainSiteContentId = "main_site_content_id"
        case parentId = "parent_id"
        case authorId = "author_id"
        case layoutTemplate = "layout_template"
        case publishBegin = "publish_begin"
        case publishEnd = "publish_end"
        case selfStatus = "self_status"
        case selfPublishBegin = "self_publish_begin"
        case selfPublishEnd = "self_publish_end"
        case excludeSearch = "exclude_search"
        case createdDate = "created_date"
        case modifiedDate = "modified_date"
        case siteRoot = "site_root"
        case deletedDate = "deleted_date"
        case excludeMenu = "exclude_menu"
        case blankLink = "blank_link"
    }
}

/// サイトモデル
struct BlogSite: Codable {
    let id: Int
    let mainSiteId: Int?
    let name: String?
    let displayName: String?
    let title: String?
    let alias: String?
    let theme: String?
    let status: Bool?
    let keyword: String?
    let description: String?
    let useSubdomain: Bool?
    let relateMainSite: Bool?
    let device: String?
    let lang: String?
    let sameMainUrl: Bool?
    let autoRedirect: Bool?
    let autoLink: Bool?
    let domainType: Int?
    let created: String?
    let modified: String?

    enum CodingKeys: String, CodingKey {
        case id, name, title, alias, theme, status, keyword, description, device, lang, created, modified
        case mainSiteId = "main_site_id"
        case displayName = "display_name"
        case useSubdomain = "use_subdomain"
        case relateMainSite = "relate_main_site"
        case sameMainUrl = "same_main_url"
        case autoRedirect = "auto_redirect"
        case autoLink = "auto_link"
        case domainType = "domain_type"
    }
}
