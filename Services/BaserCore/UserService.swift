/// ユーザー関連の API を扱うサービス
struct UserService {
    let client: ApiClient

    /// ユーザー一覧を取得する
    /// - Returns: ユーザーの配列（該当なしの場合は空配列）
    func getUsers() async throws -> [User] {
        let res: UsersIndexResponse = try await client.getIndex(route: .users)
        return res.users ?? []
    }

    /// 単一ユーザーを取得する
    /// - Parameter id: ユーザー ID
    /// - Returns: 該当するユーザー
    func getUser(id: Int) async throws -> User {
        let res: UserViewResponse = try await client.getView(route: .users, id: id)
        guard let user = res.user else {
            throw BcError.notFound(resource: "ユーザー", identifier: String(id))
        }
        return user
    }

    /// メールアドレスからユーザーを取得する
    /// - Parameter email: メールアドレス
    /// - Returns: 該当するユーザー
    func getUserByEmail(email: String) async throws -> User {
        let res: UsersIndexResponse = try await client.getIndex(route: .users, query: ["email": email])
        guard let user = res.users?.first else {
            throw BcError.notFound(resource: "ユーザー", identifier: email)
        }
        return user
    }

    /// ユーザーを追加する
    /// - Parameter request: 追加するユーザーの情報
    /// - Returns: 追加したユーザー
    func addUser(_ request: UserAddRequest) async throws -> User {
        let res: UserAddResponse = try await client.add(route: .users, data: request)
        return res.user
    }
}
