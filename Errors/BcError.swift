import Foundation

/// baserCMS エラー
public enum BcError: LocalizedError {
    /// 無効な URL です
    case invalidURL

    /// サーバーからの応答が不正です
    case invalidResponse

    /// 認証に失敗しました。トークンが取得できませんでした
    case authenticationFailed

    /// 指定したリソースが見つかりません
    case notFound(resource: String, identifier: String? = nil)

    /// HTTP エラー (statusCode)
    case httpError(statusCode: Int, message: String? = nil)

    /// エラーの説明文を返す
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "無効な URL です"
        case .invalidResponse:
            return "サーバーからの応答が不正です"
        case .authenticationFailed:
            return "認証に失敗しました。トークンが取得できませんでした"
        case let .notFound(resource, identifier):
            if let identifier {
                return "\(resource)が見つかりません（\(identifier)）"
            }
            return "\(resource)が見つかりません"
        case let .httpError(statusCode, message):
            if let message = message {
                return "HTTP エラー (\(statusCode)): \(message)"
            }
            return "HTTP エラー (\(statusCode))"
        }
    }
}
