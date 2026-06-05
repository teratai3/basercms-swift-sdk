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
  func getIndex<T: Decodable>(route: Route, query: [String: String] = [:]) async throws -> T {
    try await send(path: "\(route.basePath)/index.json", method: "GET", query: query)
  }

  /// 単一リソースを取得する（GET .../view/{id}.json）
  /// - Parameters:
  ///   - route: リソースのルート
  ///   - id: リソースの ID
  /// - Returns: デコードしたレスポンス
  func getView<T: Decodable>(route: Route, id: Int) async throws -> T {
    try await send(path: "\(route.basePath)/view/\(id).json", method: "GET")
  }

  /// リソースを追加する（POST .../add.json）
  /// - Parameters:
  ///   - route: リソースのルート
  ///   - data: リソースのデータ
  /// - Returns: デコードしたレスポンス
  func add<T: Encodable, R: Decodable>(route: Route, data: T) async throws -> R {
    let httpBody = try JSONEncoder().encode(data)
    return try await send(path: "\(route.basePath)/add.json", method: "POST", httpBody: httpBody)
  }

  /// リソースを編集する（POST .../edit/{id}.json）
  /// - Parameters:
  ///   - route: リソースのルート
  ///   - id: リソースの ID
  ///   - data: 編集するリソースのデータ
  /// - Returns: デコードしたレスポンス
  func edit<T: Encodable, R: Decodable>(route: Route, id: Int, data: T) async throws -> R {
    let httpBody = try JSONEncoder().encode(data)
    return try await send(path: "\(route.basePath)/edit/\(id).json", method: "POST", httpBody: httpBody)
  }

  /// リソースを削除する（POST .../delete/{id}.json）
  /// - Parameters:
  ///   - route: リソースのルート
  ///   - id: リソースの ID
  func delete(route: Route, id: Int) async throws {
    // send() はジェネリックで必ず Decodable な型が必要なため、
    // フィールドを持たないダミー型を用意してデコード先として渡す。
    // Swift の JSONDecoder は未知のキーを無視するので、
    // 実際の JSON レスポンスがどんな形でもデコードが成功する。
    struct Empty: Decodable {}
    let _: Empty = try await send(path: "\(route.basePath)/delete/\(id).json", method: "POST")
  }

  /// リソースを削除し、レスポンスを返す（POST .../delete/{id}.json）
  /// - Parameters:
  ///   - route: リソースのルート
  ///   - id: リソースの ID
  /// - Returns: デコードしたレスポンス
  func delete<R: Decodable>(route: Route, id: Int) async throws -> R {
    try await send(path: "\(route.basePath)/delete/\(id).json", method: "POST")
  }

  /// リソースをマルチパートフォームデータで追加する（POST .../add.json）
  ///
  /// `data` を JSON エンコードし、各フィールドを multipart のテキストパートに変換する。
  /// `nil` の Optional フィールドは JSON で `null` になるため変換時に除外される。
  ///
  /// - Parameters:
  ///   - route: リソースのルート
  ///   - data: Encodable なリクエスト。CodingKeys で定義したキー名がそのままフィールド名になる
  ///   - file: アップロードするファイル。`nil` の場合はテキストフィールドのみ送信する
  /// - Returns: デコードしたレスポンス
  func addMultipart<T: Encodable, R: Decodable>(
    route: Route,
    data: T,
    file: (name: String, data: Data, fileName: String, mimeType: String)? = nil
  ) async throws -> R {
    // Encodable → JSON → [String: Any] の順に変換してフィールド名と値を取り出す。
    // JSONEncoder が CodingKeys のキー名を保証するため、ここで明示的なマッピングは不要。
    let jsonData = try JSONEncoder().encode(data)
    let jsonObject = (try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any]) ?? [:]

    // NSNull（nil 由来）は除外し、String / 数値のみ文字列化してフィールドに追加する
    let fields: [(name: String, value: String?)] = jsonObject.compactMap { key, value in
      switch value {
      case let s as String:   return (key, s)
      case let n as NSNumber: return (key, n.stringValue)
      default:                return nil  // NSNull など
      }
    }

    let boundary = "Boundary-\(UUID().uuidString)"
    let body = buildMultipartBody(boundary: boundary, fields: fields, file: file)
    return try await send(
      path: "\(route.basePath)/add.json",
      method: "POST",
      httpBody: body,
      contentType: "multipart/form-data; boundary=\(boundary)"
    )
  }

  /// multipart/form-data ボディを RFC 2046 形式で組み立てる
  ///
  /// - Parameters:
  ///   - boundary: パートを区切る境界文字列
  ///   - fields: テキストフィールドの配列。`value` が `nil` のエントリはスキップする
  ///   - file: ファイルパート。`nil` の場合はファイルパートを含めない
  /// - Returns: 完成した HTTP ボディ
  private func buildMultipartBody(
    boundary: String,
    fields: [(name: String, value: String?)],
    file: (name: String, data: Data, fileName: String, mimeType: String)?
  ) -> Data {
    var body = Data()

    // テキストフィールドパート
    for field in fields {
      guard let value = field.value else { continue }
      body.append(Data("--\(boundary)\r\n".utf8))
      body.append(Data("Content-Disposition: form-data; name=\"\(field.name)\"\r\n".utf8))
      body.append(Data("\r\n".utf8))
      body.append(Data(value.utf8))
      body.append(Data("\r\n".utf8))
    }

    // ファイルパート
    if let file = file {
      body.append(Data("--\(boundary)\r\n".utf8))
      body.append(Data("Content-Disposition: form-data; name=\"\(file.name)\"; filename=\"\(file.fileName)\"\r\n".utf8))
      body.append(Data("Content-Type: \(file.mimeType)\r\n".utf8))
      body.append(Data("\r\n".utf8))
      body.append(file.data)
      body.append(Data("\r\n".utf8))
    }

    // 終端境界
    body.append(Data("--\(boundary)--\r\n".utf8))
    return body
  }

  /// HTTP リクエストを送信し、JSON をデコードして返す
  /// - Parameters:
  ///   - path: ベース URL からの相対パス
  ///   - method: HTTP メソッド
  ///   - httpBody: リクエストボディ（任意）
  ///   - contentType: Content-Type ヘッダー（デフォルト: application/json）
  ///   - requiresAuth: 認証トークンを付与するか（デフォルト: true）
  ///   - query: クエリパラメーター
  /// - Returns: デコードしたレスポンス
  private func send<T: Decodable>(
    path: String,
    method: String,
    httpBody: Data? = nil,
    contentType: String = "application/json",
    requiresAuth: Bool = true,
    query: [String: String] = [:]
  ) async throws -> T {
    let basePathURL = baseURL.appendingPathComponent(path)
    var components = URLComponents(url: basePathURL, resolvingAgainstBaseURL: false)!

    if !query.isEmpty {
      components.queryItems = query.map {
        URLQueryItem(name: $0.key, value: $0.value)
      }
    }

    // クエリーパラメーターでurlが失敗する可能性があるので、guardでチェック
    guard let url = components.url else {
      throw BcError.invalidURL
    }

    // リクエストを作成
    var request = URLRequest(url: url)
    request.httpMethod = method
    request.setValue(contentType, forHTTPHeaderField: "Content-Type")
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
