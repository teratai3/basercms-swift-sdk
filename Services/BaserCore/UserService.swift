/// ユーザー関連の API を扱うサービス
struct UserService {
    let client: ApiClient

    /// ユーザー一覧を取得する
    /// - Returns: ユーザーの配列（該当なしの場合は空配列）
    func getUsers() async throws -> [User] {
        let res: UsersIndexResponse = try await client.get(route: .users)
        return res.users ?? []
    }
}
