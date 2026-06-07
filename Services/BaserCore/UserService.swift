/// ユーザー関連の API を扱うサービス
public struct UserService {
    public let client: ApiClient

    /// コンストラクタ
    public init(client: ApiClient) {
        self.client = client
    }

    /// ユーザー一覧を取得する
    /// - Returns: ユーザーの配列（該当なしの場合は空配列）
    public func getUsers() async throws -> [User] {
        let res: UsersIndexResponse = try await client.getIndex(route: .users)
        return res.users ?? []
    }

    /// 単一ユーザーを取得する
    /// - Parameter id: ユーザー ID
    /// - Returns: 該当するユーザー
    public func getUser(id: Int) async throws -> User {
        let res: UserViewResponse = try await client.getView(route: .users, id: id)
        guard let user = res.user else {
            throw BcError.notFound(resource: "ユーザー", identifier: String(id))
        }
        return user
    }

    /// メールアドレスからユーザーを取得する
    /// - Parameter email: メールアドレス
    /// - Returns: 該当するユーザー
    public func getUserByEmail(email: String) async throws -> User {
        let res: UsersIndexResponse = try await client.getIndex(route: .users, query: ["email": email])
        guard let user = res.users?.first else {
            throw BcError.notFound(resource: "ユーザー", identifier: email)
        }
        return user
    }

    /// ユーザーを追加する
    /// - Parameter request: 追加するユーザーの情報
    /// - Returns: 追加したユーザー
    public func addUser(_ request: UserAddRequest) async throws -> User {
        let res: UserSaveResponse = try await client.add(route: .users, data: request)
        guard let user = res.user else {
            throw BcError.notFound(resource: "ユーザー", identifier: request.email)
        }
        return user
    }

    /// ユーザーを編集する
    /// - Parameter id: ユーザー ID
    /// - Parameter request: 編集するユーザーの情報
    /// - Returns: 編集したユーザー
    public func editUser(id: Int, _ request: UserEditRequest) async throws -> User {
        let res: UserSaveResponse = try await client.edit(route: .users, id: id, data: request)
        guard let user = res.user else {
            throw BcError.notFound(resource: "ユーザー", identifier: String(id))
        }
        return user
    }

    /// ユーザーを削除する
    /// - Parameter id: ユーザー ID
    public func deleteUser(id: Int) async throws {
        try await client.delete(route: .users, id: id)
    }
}
