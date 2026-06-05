/// ルート
struct Route: Equatable {
    let plugin: String
    let controller: String

    static let users = Route(plugin: "baser-core", controller: "users")
    static let blogPosts = Route(plugin: "bc-blog", controller: "blog_posts")

    /// API のベースパス（/baser/api/admin/{plugin}/{controller}）
    var basePath: String { "baser/api/admin/\(plugin)/\(controller)" }
}
