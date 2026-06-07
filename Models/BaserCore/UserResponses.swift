import Foundation

/// GET /baser/api/admin/baser-core/users/index.json のレスポンス
public struct UsersIndexResponse: Decodable {
    public let users: [User]?
    public let message: String?
}

/// GET /baser/api/admin/baser-core/users/view/{id}.json のレスポンス
public struct UserViewResponse: Decodable {
    public let user: User?
    public let message: String?
}

/// POST /baser/api/admin/baser-core/users/add.json のリクエスト
public struct UserAddRequest: Encodable {
    public let name: String?
    public let email: String
    public let password1: String
    public let password2: String
    public let realName1: String
    public let realName2: String?
    public let nickname: String?
    public let status: Bool
    public let userGroups: UserGroups

    /// user_groups._ids
    public struct UserGroups: Encodable {
        public let ids: [Int]

        enum CodingKeys: String, CodingKey {
            case ids = "_ids"
        }

        /// コンストラクタ
        public init(
            ids: [Int]
        ) {
            self.ids = ids
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

    /// コンストラクタ
    public init(
        name: String? = nil,
        email: String,
        password1: String,
        password2: String,
        realName1: String,
        realName2: String? = nil,
        nickname: String? = nil,
        status: Bool,
        userGroups: UserGroups
    ) {
        self.name = name
        self.email = email
        self.password1 = password1
        self.password2 = password2
        self.realName1 = realName1
        self.realName2 = realName2
        self.nickname = nickname
        self.status = status
        self.userGroups = userGroups
    }
}

/// POST /baser/api/admin/baser-core/users/edit/{id}.json のリクエスト
public struct UserEditRequest: Encodable {
    public let name: String?
    public let email: String
    public let realName1: String
    public let realName2: String?
    public let nickname: String?
    public let status: Bool
    public let userGroups: UserAddRequest.UserGroups
    /// 変更する場合のみ指定（省略時は JSON に含めない）
    public let password1: String?
    public let password2: String?

    enum CodingKeys: String, CodingKey {
        case name, email, nickname, status
        case password1 = "password_1"
        case password2 = "password_2"
        case realName1 = "real_name_1"
        case realName2 = "real_name_2"
        case userGroups = "user_groups"
    }

    /// コンストラクタ
    public init(
        name: String? = nil,
        email: String,
        realName1: String,
        realName2: String? = nil,
        nickname: String? = nil,
        status: Bool,
        userGroups: UserAddRequest.UserGroups,
        password1: String? = nil,
        password2: String? = nil
    ) {
        self.name = name
        self.email = email
        self.realName1 = realName1
        self.realName2 = realName2
        self.nickname = nickname
        self.status = status
        self.userGroups = userGroups
        self.password1 = password1
        self.password2 = password2
    }
}

/// POST .../users/add.json および edit/{id}.json のレスポンス（形は同じ）
public struct UserSaveResponse: Decodable {
    public let user: User?
    public let message: String?
    public let error: String?
}
