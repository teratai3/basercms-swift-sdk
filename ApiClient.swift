import Foundation

/// baserCMS API クライアント
class ApiClient {
    
    /// 基底 URL
    private let baseURL: URL
    
    /// ログイン用メールアドレス
    private var email: String

    /// ログイン用パスワード
    private var password: String

    /// アクセストークン
    private var accessToken: String?

    /// コンストラクタ
    init(baseURL: URL, email: String, password: String) {
        self.baseURL = baseURL
        self.email = email
        self.password = password
    }
    
    /// ログイン
    func login() async throws {
        let url = baseURL.appendingPathComponent("baser/api/admin/baser-core/users/login.json")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["email": email, "password": password]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        /// リクエストを送信
        let (data, response) = try await URLSession.shared.data(for: request)
        
        /// レスポンスを確認
        guard let httpResponse = response as? HTTPURLResponse else {
            throw BcError.invalidResponse
        }

        /// ステータスコードを確認
        guard httpResponse.statusCode == 200 else {
            let errorMessage = try? JSONDecoder().decode(ErrorResponse.self, from: data).message
            throw BcError.httpError(statusCode: httpResponse.statusCode, message: errorMessage)
        }

        let json = try JSONDecoder().decode(LoginResponse.self, from: data)
    
        accessToken = json.accessToken
    }
}