import Foundation

/// GET /baser/api/admin/baser-core/users/index.json のレスポンス
struct UsersIndexResponse: Decodable {
    let users: [User]?
    let message: String?
}

/// GET /baser/api/admin/baser-core/users/view/{id}.json のレスポンス
struct UserViewResponse: Decodable {
    let user: User?
    let message: String?
}
