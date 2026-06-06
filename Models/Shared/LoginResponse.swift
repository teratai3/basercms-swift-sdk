/// ログインレスポンス
struct LoginResponse: Decodable {
    /// アクセストークン
    let accessToken: String

    /// リフレッシュトークン
    let refreshToken: String

    /// コーディングキー
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
