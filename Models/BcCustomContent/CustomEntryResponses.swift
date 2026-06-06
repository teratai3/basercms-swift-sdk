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
struct CustomEntryAddRequest: Encodable {
    let customTableId: Int
    let name: String?
    let title: String
    let status: Bool
    let creatorId: Int

    enum CodingKeys: String, CodingKey {
        case name, title, status
        case customTableId = "custom_table_id"
        case creatorId = "creator_id"
    }
}

/// POST .../custom_entries/add.json のレスポンス
struct CustomEntryAddResponse: Decodable {
    let entry: CustomEntry?
    let message: String?
}

/// POST .../custom_entries/edit/{id}.json のリクエスト
struct CustomEntryEditRequest: Encodable {
    let customTableId: Int
    let name: String?
    let title: String?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case name, title, status
        case customTableId = "custom_table_id"
    }
}

/// POST .../custom_entries/edit/{id}.json のレスポンス
struct CustomEntryEditResponse: Decodable {
    let entry: CustomEntry?
    let message: String?
}
