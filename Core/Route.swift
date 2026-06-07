/// ルート
public struct Route: Equatable {
    /// API の種別
    public enum ApiType: Equatable {
        /// 管理画面 API（/baser/api/admin/...、要認証）
        case admin
        /// フロント API（/baser/api/...）
        case front
    }

    public let plugin: String
    public let controller: String
    public let apiType: ApiType

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

    /// API のベースパス
    /// - admin: baser/api/admin/{plugin}/{controller}
    /// - front: baser/api/{plugin}/{controller}
    public var basePath: String {
        switch apiType {
        case .admin:
            return "baser/api/admin/\(plugin)/\(controller)"
        case .front:
            return "baser/api/\(plugin)/\(controller)"
        }
    }

    /// コンストラクタ
    /// - Parameters:
    ///   - plugin: プラグイン名（例: bc-blog）
    ///   - controller: コントローラー名（例: blog_posts）
    ///   - apiType: API の種別（デフォルト: .admin）
    public init(
        plugin: String,
        controller: String,
        apiType: ApiType = .admin
    ) {
        self.plugin = plugin
        self.controller = controller
        self.apiType = apiType
    }
}
