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

        // リクエストを送信
        let (data, response) = try await URLSession.shared.data(for: request)

        // レスポンスを検証
        let validData = try validate(data: data, response: response)

        let json = try JSONDecoder().decode(LoginResponse.self, from: validData)

        accessToken = json.accessToken
    }

    /// 一覧を取得する（GET .../index.json）
    /// - Parameter route: リソースのルート
    /// - Returns: デコードしたレスポンス
    func getIndex<T: Decodable>(route: Route) async throws -> T {
        try await get(path: "\(route.basePath)/index.json")
    }

    /// 単一リソースを取得する（GET .../view/{id}.json）
    /// - Parameters:
    ///   - route: リソースのルート
    ///   - id: リソースの ID
    /// - Returns: デコードしたレスポンス
    func getView<T: Decodable>(route: Route, id: Int) async throws -> T {
        try await get(path: "\(route.basePath)/view/\(id).json")
    }

    /// 認証付き GET リクエストを送信し、JSON をデコードして返す
    /// - Parameter path: ベース URL からの相対パス
    /// - Returns: デコードしたレスポンス
    private func get<T: Decodable>(path: String) async throws -> T {
        // トークンを確認
        guard let accessToken = accessToken else {
            throw BcError.authenticationFailed
        }

        let url = baseURL.appendingPathComponent(path)

        // リクエストを作成
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        // リクエストを送信
        let (data, response) = try await URLSession.shared.data(for: request)

        // レスポンスを検証
        let validData = try validate(data: data, response: response)

        return try JSONDecoder().decode(T.self, from: validData)
    }

    /// HTTP レスポンスを検証し、問題なければボディを返す
    private func validate(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw BcError.invalidResponse
        }

        guard httpResponse.statusCode == 200 else {
            let errorMessage = try? JSONDecoder().decode(ErrorResponse.self, from: data).message
            throw BcError.httpError(statusCode: httpResponse.statusCode, message: errorMessage)
        }

        return data
    }
}