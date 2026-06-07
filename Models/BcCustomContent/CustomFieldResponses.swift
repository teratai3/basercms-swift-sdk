import Foundation

/// GET .../custom_fields/index.json のレスポンス
struct CustomFieldsIndexResponse: Decodable {
    let customFields: [CustomField]?
    let message: String?
}

/// GET .../custom_fields/view/{id}.json のレスポンス
struct CustomFieldViewResponse: Decodable {
    let customField: CustomField?
    let message: String?
}

/// POST .../custom_fields/add.json のリクエスト
public struct CustomFieldAddRequest: Encodable {
    public let name: String
    public let title: String
    public let type: String
    public let status: Bool

    enum CodingKeys: String, CodingKey {
        case name, title, type, status
    }

    /// コンストラクタ
    public init(
        name: String,
        title: String,
        type: String,
        status: Bool
    ) {
        self.name = name
        self.title = title
        self.type = type
        self.status = status
    }
}

/// POST .../custom_fields/add.json のレスポンス
struct CustomFieldAddResponse: Decodable {
    let customField: CustomField?
    let message: String?
}

/// POST .../custom_fields/edit/{id}.json のリクエスト
public struct CustomFieldEditRequest: Encodable {
    public let name: String?
    public let title: String?
    public let type: String?
    public let status: Bool?

    enum CodingKeys: String, CodingKey {
        case name, title, type, status
    }

    /// コンストラクタ
    public init(
        name: String? = nil,
        title: String? = nil,
        type: String? = nil,
        status: Bool? = nil
    ) {
        self.name = name
        self.title = title
        self.type = type
        self.status = status
    }
}

/// POST .../custom_fields/edit/{id}.json のレスポンス
struct CustomFieldEditResponse: Decodable {
    let customField: CustomField?
    let message: String?
}
