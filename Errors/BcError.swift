import Foundation

/// baserCMS エラー
enum BcError: LocalizedError {

    // サーバーからの応答が不正です
    case invalidResponse
    
    // 認証に失敗しました。トークンが取得できませんでした
    case authenticationFailed
    
    // HTTP エラー (statusCode)
    case httpError(statusCode: Int, message: String? = nil)

    /// エラーの説明文を返す
    var errorDescription: String? {
        switch self {
            case .invalidResponse:
                return "サーバーからの応答が不正です"
            case .authenticationFailed:
                return "認証に失敗しました。トークンが取得できませんでした"
            case .httpError(let statusCode, let message):
                if let message = message {
                    return "HTTP エラー (\(statusCode)): \(message)"
                }
                return "HTTP エラー (\(statusCode))"
        }
    }
}