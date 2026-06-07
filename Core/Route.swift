/// ルート
public struct Route: Equatable {
    public let plugin: String
    public let controller: String

    public static let users = Route(plugin: "baser-core", controller: "users")
    public static let blogPosts = Route(plugin: "bc-blog", controller: "blog_posts")
    public static let blogCategories = Route(plugin: "bc-blog", controller: "blog_categories")
    public static let blogTags = Route(plugin: "bc-blog", controller: "blog_tags")
    public static let blogContents = Route(plugin: "bc-blog", controller: "blog_contents")
    public static let customTables = Route(plugin: "bc-custom-content", controller: "custom_tables")
    public static let customEntries = Route(plugin: "bc-custom-content", controller: "custom_entries")
    public static let customFields = Route(plugin: "bc-custom-content", controller: "custom_fields")
    public static let customContents = Route(plugin: "bc-custom-content", controller: "custom_contents")
    public static let customLinks = Route(plugin: "bc-custom-content", controller: "custom_links")

    /// API のベースパス（/baser/api/admin/{plugin}/{controller}）
    public var basePath: String {
        "baser/api/admin/\(plugin)/\(controller)"
    }

    /// コンストラクタ
    public init(
        plugin: String,
        controller: String
    ) {
        self.plugin = plugin
        self.controller = controller
    }
}
