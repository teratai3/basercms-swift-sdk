/// カスタムフィールドモデル
public struct CustomField: Codable {
    public let id: Int
    public let name: String?
    public let title: String?
    public let type: String?
    public let status: Bool?
    public let defaultValue: String?
    public let validate: String?
    public let regex: String?
    public let regexErrorMessage: String?
    public let counter: Bool?
    public let autoConvert: String?
    public let placeholder: String?
    public let size: Int?
    public let line: Int?
    public let maxLength: Int?
    public let source: String?
    public let created: String?
    public let modified: String?

    enum CodingKeys: String, CodingKey {
        case id, name, title, type, status, validate, regex, counter, placeholder, size, line, source, created, modified
        case defaultValue = "default_value"
        case regexErrorMessage = "regex_error_message"
        case autoConvert = "auto_convert"
        case maxLength = "max_length"
    }
}
