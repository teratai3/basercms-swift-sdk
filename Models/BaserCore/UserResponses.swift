import Foundation

/// GET /baser/api/admin/baser-core/users/index.json のレスポンス
struct UsersIndexResponse: Decodable {
    let users: [User]?
    let message: String?
}