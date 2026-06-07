import Foundation

/// GET .../custom_entries/index.json のレスポンス
/// レスポンスキーは `entries`（`customEntries` ではない）
struct CustomEntriesIndexResponse: Decodable {
    let entries: [CustomEntry]?
    let message: String?
}

/// GET .../custom_entries/view/{id}.json のレスポンス
struct CustomEntryViewResponse: Decodable {
    let entry: CustomEntry?
    let message: String?
}

/// POST .../custom_entries/add.json のリクエスト
/// カスタムテーブルに定義したフィールドの値は `customFields` で指定する
public struct CustomEntryAddRequest: Encodable {
    public let customTableId: Int
    public let name: String?
    public let title: String
    public let status: Bool
    public let creatorId: Int

    /// カスタムフィールド値（キーはフィールド名）
    public let customFields: [String: BcValue]

    public init(
        customTableId: Int,
        name: String? = nil,
        title: String,
        status: Bool,
        creatorId: Int,
        customFields: [String: BcValue] = [:]
    ) {
        self.customTableId = customTableId
        self.name = name
        self.title = title
        self.status = status
        self.creatorId = creatorId
        self.customFields = customFields
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BcCodingKey.self)
        try container.encode(customTableId, forKey: BcCodingKey("custom_table_id"))
        try container.encodeIfPresent(name, forKey: BcCodingKey("name"))
        try container.encode(title, forKey: BcCodingKey("title"))
        try container.encode(status, forKey: BcCodingKey("status"))
        try container.encode(creatorId, forKey: BcCodingKey("creator_id"))
        for (key, value) in customFields {
            try container.encode(value, forKey: BcCodingKey(key))
        }
    }
}

/// POST .../custom_entries/add.json のレスポンス
struct CustomEntryAddResponse: Decodable {
    let entry: CustomEntry?
    let message: String?
}

/// POST .../custom_entries/edit/{id}.json のリクエスト
/// カスタムテーブルに定義したフィールドの値は `customFields` で指定する
public struct CustomEntryEditRequest: Encodable {
    public let customTableId: Int
    public let name: String?
    public let title: String?
    public let status: Bool?

    /// カスタムフィールド値（キーはフィールド名）
    public let customFields: [String: BcValue]

    public init(
        customTableId: Int,
        name: String? = nil,
        title: String? = nil,
        status: Bool? = nil,
        customFields: [String: BcValue] = [:]
    ) {
        self.customTableId = customTableId
        self.name = name
        self.title = title
        self.status = status
        self.customFields = customFields
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BcCodingKey.self)
        try container.encode(customTableId, forKey: BcCodingKey("custom_table_id"))
        try container.encodeIfPresent(name, forKey: BcCodingKey("name"))
        try container.encodeIfPresent(title, forKey: BcCodingKey("title"))
        try container.encodeIfPresent(status, forKey: BcCodingKey("status"))
        for (key, value) in customFields {
            try container.encode(value, forKey: BcCodingKey(key))
        }
    }
}

/// POST .../custom_entries/edit/{id}.json のレスポンス
struct CustomEntryEditResponse: Decodable {
    let entry: CustomEntry?
    let message: String?
}
