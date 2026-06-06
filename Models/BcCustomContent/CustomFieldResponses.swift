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
struct CustomFieldAddRequest: Encodable {
    let name: String
    let title: String
    let type: String
    let status: Bool

    enum CodingKeys: String, CodingKey {
        case name, title, type, status
    }
}

/// POST .../custom_fields/add.json のレスポンス
struct CustomFieldAddResponse: Decodable {
    let customField: CustomField?
    let message: String?
}

/// POST .../custom_fields/edit/{id}.json のリクエスト
struct CustomFieldEditRequest: Encodable {
    let name: String?
    let title: String?
    let type: String?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case name, title, type, status
    }
}

/// POST .../custom_fields/edit/{id}.json のレスポンス
struct CustomFieldEditResponse: Decodable {
    let customField: CustomField?
    let message: String?
}
