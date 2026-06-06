/// ルート
struct Route: Equatable {
    let plugin: String
    let controller: String

    static let users = Route(plugin: "baser-core", controller: "users")
    static let blogPosts = Route(plugin: "bc-blog", controller: "blog_posts")
    static let blogCategories = Route(plugin: "bc-blog", controller: "blog_categories")
    static let blogTags = Route(plugin: "bc-blog", controller: "blog_tags")
    static let blogContents = Route(plugin: "bc-blog", controller: "blog_contents")
    static let customTables = Route(plugin: "bc-custom-content", controller: "custom_tables")
    static let customEntries = Route(plugin: "bc-custom-content", controller: "custom_entries")
    static let customFields = Route(plugin: "bc-custom-content", controller: "custom_fields")
    static let customContents = Route(plugin: "bc-custom-content", controller: "custom_contents")

    /// API のベースパス（/baser/api/admin/{plugin}/{controller}）
    var basePath: String { "baser/api/admin/\(plugin)/\(controller)" }
}
