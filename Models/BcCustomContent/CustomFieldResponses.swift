import Foundation

/// GET .../custom_fields/index.json のレスポンス
public struct CustomFieldsIndexResponse: Decodable {
    public let customFields: [CustomField]?
    public let message: String?
}

/// GET .../custom_fields/view/{id}.json のレスポンス
public struct CustomFieldViewResponse: Decodable {
    public let customField: CustomField?
    public let message: String?
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
public struct CustomFieldAddResponse: Decodable {
    public let customField: CustomField?
    public let message: String?
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
public struct CustomFieldEditResponse: Decodable {
    public let customField: CustomField?
    public let message: String?
}
