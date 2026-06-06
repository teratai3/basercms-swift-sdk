/// ルート
struct Route: Equatable {
    let plugin: String
    let controller: String

    static let users = Route(plugin: "baser-core", controller: "users")
    static let blogPosts = Route(plugin: "bc-blog", controller: "blog_posts")
    static let blogCategories = Route(plugin: "bc-blog", controller: "blog_categories")

    /// API のベースパス（/baser/api/admin/{plugin}/{controller}）
    var basePath: String { "baser/api/admin/\(plugin)/\(controller)" }
}
