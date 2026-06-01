import Foundation

/// baserCMS API クライアント
final class ApiClient {

    /// 基底 URL
    private let baseURL: URL

    /// ログイン用メールアドレス
    private let email: String

    /// ログイン用パスワード
    private let password: String

    /// アクセストークン
    private var accessToken: String?

    /// コンストラクタ
    init(baseURL: URL, email: String, password: String) {
        self.baseURL = baseURL
        self.email = email
        self.password = password
    }

    /// ログイン（POST .../users/login.json）
    func login() async throws {
        let httpBody = try JSONEncoder().encode(["email": email, "password": password])
        let json: LoginResponse = try await send(
            path: "baser/api/admin/baser-core/users/login.json",
            method: "POST",
            httpBody: httpBody,
            requiresAuth: false
        )
        accessToken = json.accessToken
    }

    /// 一覧を取得する（GET .../index.json）
    /// - Parameter route: リソースのルート
    /// - Returns: デコードしたレスポンス
    func getIndex<T: Decodable>(route: Route) async throws -> T {
        try await send(path: "\(route.basePath)/index.json", method: "GET")
    }

    /// 単一リソースを取得する（GET .../view/{id}.json）
    /// - Parameters:
    ///   - route: リソースのルート
    ///   - id: リソースの ID
    /// - Returns: デコードしたレスポンス
    func getView<T: Decodable>(route: Route, id: Int) async throws -> T {
        try await send(path: "\(route.basePath)/view/\(id).json", method: "GET")
    }

    /// HTTP リクエストを送信し、JSON をデコードして返す
    /// - Parameters:
    ///   - path: ベース URL からの相対パス
    ///   - method: HTTP メソッド
    ///   - httpBody: リクエストボディ（任意）
    ///   - requiresAuth: 認証トークンを付与するか（デフォルト: true）
    /// - Returns: デコードしたレスポンス
    private func send<T: Decodable>(
        path: String,
        method: String,
        httpBody: Data? = nil,
        requiresAuth: Bool = true
    ) async throws -> T {
        let url = baseURL.appendingPathComponent(path)

        // リクエストを作成
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")

        // 認証トークンを付与
        if requiresAuth {
            guard let accessToken = accessToken else {
                throw BcError.authenticationFailed
            }
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }

        // ボディを付与
        if let httpBody = httpBody {
            request.httpBody = httpBody
        }

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
