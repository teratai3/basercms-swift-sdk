import Foundation

/// GET .../custom_tables/index.json のレスポンス
struct CustomTablesIndexResponse: Decodable {
    let customTables: [CustomTable]?
    let message: String?
}

/// GET .../custom_tables/view/{id}.json のレスポンス
struct CustomTableViewResponse: Decodable {
    let customTable: CustomTable?
    let message: String?
}

/// POST .../custom_tables/add.json のリクエスト
struct CustomTableAddRequest: Encodable {
    let type: String
    let name: String
    let title: String
    let displayField: String
    let hasChild: Bool

    enum CodingKeys: String, CodingKey {
        case type, name, title
        case displayField = "display_field"
        case hasChild = "has_child"
    }
}

/// POST .../custom_tables/add.json のレスポンス
struct CustomTableAddResponse: Decodable {
    let customTable: CustomTable?
    let message: String?
}

/// POST .../custom_tables/edit/{id}.json のリクエスト
struct CustomTableEditRequest: Encodable {
    let type: String?
    let name: String?
    let title: String?
    let displayField: String?
    let hasChild: Bool?

    enum CodingKeys: String, CodingKey {
        case type, name, title
        case displayField = "display_field"
        case hasChild = "has_child"
    }
}

/// POST .../custom_tables/edit/{id}.json のレスポンス
struct CustomTableEditResponse: Decodable {
    let customTable: CustomTable?
    let message: String?
}
