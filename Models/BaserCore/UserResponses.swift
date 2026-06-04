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

/// POST /baser/api/admin/baser-core/users/add.json のリクエスト
struct UserAddRequest: Encodable {
    let name: String?
    let email: String
    let password1: String
    let password2: String
    let realName1: String
    let realName2: String?
    let nickname: String?
    let status: Bool
    let userGroups: UserGroups

    /// user_groups._ids
    struct UserGroups: Encodable {
        let ids: [Int]

        enum CodingKeys: String, CodingKey {
            case ids = "_ids"
        }
    }

    enum CodingKeys: String, CodingKey {
        case name, email, nickname, status
        case password1 = "password_1"
        case password2 = "password_2"
        case realName1 = "real_name_1"
        case realName2 = "real_name_2"
        case userGroups = "user_groups"
    }
}

/// POST /baser/api/admin/baser-core/users/edit/{id}.json のリクエスト
struct UserEditRequest: Encodable {
    let name: String?
    let email: String
    let realName1: String
    let realName2: String?
    let nickname: String?
    let status: Bool
    let userGroups: UserAddRequest.UserGroups
    /// 変更する場合のみ指定（省略時は JSON に含めない）
    let password1: String?
    let password2: String?

    enum CodingKeys: String, CodingKey {
        case name, email, nickname, status
        case password1 = "password_1"
        case password2 = "password_2"
        case realName1 = "real_name_1"
        case realName2 = "real_name_2"
        case userGroups = "user_groups"
    }
}

/// POST .../users/add.json および edit/{id}.json のレスポンス（形は同じ）
struct UserSaveResponse: Decodable {
    let user: User?
    let message: String?
    let error: String?
}
