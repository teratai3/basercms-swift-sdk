/// ルート
enum Route {
    case users
    var plugin: String { "baser-core" }
    var controller: String { "users" }

    /// API のベースパス（/baser/api/admin/{plugin}/{controller}）
    var basePath: String { "baser/api/admin/\(plugin)/\(controller)" }
}