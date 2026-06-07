import Foundation

/// GET .../custom_tables/index.json のレスポンス
public struct CustomTablesIndexResponse: Decodable {
    public let customTables: [CustomTable]?
    public let message: String?
}

/// GET .../custom_tables/view/{id}.json のレスポンス
public struct CustomTableViewResponse: Decodable {
    public let customTable: CustomTable?
    public let message: String?
}

/// POST .../custom_tables/add.json のリクエスト
public struct CustomTableAddRequest: Encodable {
    public let type: String
    public let name: String
    public let title: String
    public let displayField: String
    public let hasChild: Bool

    enum CodingKeys: String, CodingKey {
        case type, name, title
        case displayField = "display_field"
        case hasChild = "has_child"
    }

    /// コンストラクタ
    public init(
        type: String,
        name: String,
        title: String,
        displayField: String,
        hasChild: Bool
    ) {
        self.type = type
        self.name = name
        self.title = title
        self.displayField = displayField
        self.hasChild = hasChild
    }
}

/// POST .../custom_tables/add.json のレスポンス
public struct CustomTableAddResponse: Decodable {
    public let customTable: CustomTable?
    public let message: String?
}

/// POST .../custom_tables/edit/{id}.json のリクエスト
public struct CustomTableEditRequest: Encodable {
    public let type: String?
    public let name: String?
    public let title: String?
    public let displayField: String?
    public let hasChild: Bool?

    enum CodingKeys: String, CodingKey {
        case type, name, title
        case displayField = "display_field"
        case hasChild = "has_child"
    }

    /// コンストラクタ
    public init(
        type: String? = nil,
        name: String? = nil,
        title: String? = nil,
        displayField: String? = nil,
        hasChild: Bool? = nil
    ) {
        self.type = type
        self.name = name
        self.title = title
        self.displayField = displayField
        self.hasChild = hasChild
    }
}

/// POST .../custom_tables/edit/{id}.json のレスポンス
public struct CustomTableEditResponse: Decodable {
    public let customTable: CustomTable?
    public let message: String?
}
