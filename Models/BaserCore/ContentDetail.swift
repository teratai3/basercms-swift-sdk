/// baser-core Content エンティティ
/// BlogContent・CustomContent など複数プラグインから参照される共通モデル
public struct ContentDetail: Codable {
    public let id: Int
    public let name: String?
    public let plugin: String?
    public let type: String?
    public let entityId: Int?
    public let url: String?
    public let siteId: Int?
    public let aliasId: Int?
    public let mainSiteContentId: Int?
    public let parentId: Int?
    public let lft: Int?
    public let rght: Int?
    public let level: Int?
    public let title: String?
    public let description: String?
    public let eyecatch: String?
    public let authorId: Int?
    public let layoutTemplate: String?
    public let status: Bool?
    public let publishBegin: String?
    public let publishEnd: String?
    public let selfStatus: Bool?
    public let selfPublishBegin: String?
    public let selfPublishEnd: String?
    public let excludeSearch: Bool?
    public let createdDate: String?
    public let modifiedDate: String?
    public let siteRoot: Bool?
    public let deletedDate: String?
    public let excludeMenu: Bool?
    public let blankLink: Bool?
    public let created: String?
    public let modified: String?
    public let site: SiteDetail?

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

/// baser-core Site エンティティ
public struct SiteDetail: Codable {
    public let id: Int
    public let mainSiteId: Int?
    public let name: String?
    public let displayName: String?
    public let title: String?
    public let alias: String?
    public let theme: String?
    public let status: Bool?
    public let keyword: String?
    public let description: String?
    public let useSubdomain: Bool?
    public let relateMainSite: Bool?
    public let device: String?
    public let lang: String?
    public let sameMainUrl: Bool?
    public let autoRedirect: Bool?
    public let autoLink: Bool?
    public let domainType: Int?
    public let created: String?
    public let modified: String?

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
