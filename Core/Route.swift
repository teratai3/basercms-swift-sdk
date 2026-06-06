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

    /// API のベースパス（/baser/api/admin/{plugin}/{controller}）
    var basePath: String { "baser/api/admin/\(plugin)/\(controller)" }
}
