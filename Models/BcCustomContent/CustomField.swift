/// カスタムフィールドモデル
struct CustomField: Codable {
    let id: Int
    let name: String?
    let title: String?
    let type: String?
    let status: Bool?
    let defaultValue: String?
    let validate: String?
    let regex: String?
    let regexErrorMessage: String?
    let counter: Bool?
    let autoConvert: String?
    let placeholder: String?
    let size: Int?
    let line: Int?
    let maxLength: Int?
    let source: String?
    let created: String?
    let modified: String?

    enum CodingKeys: String, CodingKey {
        case id, name, title, type, status, validate, regex, counter, placeholder, size, line, source, created, modified
        case defaultValue = "default_value"
        case regexErrorMessage = "regex_error_message"
        case autoConvert = "auto_convert"
        case maxLength = "max_length"
    }
}
