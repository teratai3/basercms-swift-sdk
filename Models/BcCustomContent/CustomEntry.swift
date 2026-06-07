/// カスタムエントリーモデル
/// 固定カラムに加え、カスタムテーブルに定義したフィールドの値を `customFields` に保持する
public struct CustomEntry: Codable {
    public let id: Int
    public let customTableId: Int?
    public let name: String?
    public let title: String?
    public let parentId: Int?
    public let lft: Int?
    public let rght: Int?
    public let level: Int?
    public let status: Bool?
    public let publishBegin: String?
    public let publishEnd: String?
    public let published: String?
    public let creatorId: Int?
    public let created: String?
    public let modified: String?

    /// 固定カラム以外のカスタムフィールド値（キーはフィールド名）
    public let customFields: [String: BcValue]

    enum CodingKeys: String, CodingKey {
        case id, name, title, lft, rght, level, status, published, created, modified
        case customTableId = "custom_table_id"
        case parentId = "parent_id"
        case publishBegin = "publish_begin"
        case publishEnd = "publish_end"
        case creatorId = "creator_id"
    }

    /// 固定カラムのキー（これ以外を customFields として取り込む）
    private static let fixedKeys: Set<String> = [
        "id", "custom_table_id", "name", "title", "parent_id", "lft", "rght", "level",
        "status", "publish_begin", "publish_end", "published", "creator_id", "created", "modified",
    ]

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        customTableId = try container.decodeIfPresent(Int.self, forKey: .customTableId)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        parentId = try container.decodeIfPresent(Int.self, forKey: .parentId)
        lft = try container.decodeIfPresent(Int.self, forKey: .lft)
        rght = try container.decodeIfPresent(Int.self, forKey: .rght)
        level = try container.decodeIfPresent(Int.self, forKey: .level)
        status = try container.decodeIfPresent(Bool.self, forKey: .status)
        publishBegin = try container.decodeIfPresent(String.self, forKey: .publishBegin)
        publishEnd = try container.decodeIfPresent(String.self, forKey: .publishEnd)
        published = try container.decodeIfPresent(String.self, forKey: .published)
        creatorId = try container.decodeIfPresent(Int.self, forKey: .creatorId)
        created = try container.decodeIfPresent(String.self, forKey: .created)
        modified = try container.decodeIfPresent(String.self, forKey: .modified)

        // 固定カラム以外のキーをカスタムフィールドとして取り込む
        let dynamic = try decoder.container(keyedBy: BcCodingKey.self)
        var fields: [String: BcValue] = [:]
        for key in dynamic.allKeys where !Self.fixedKeys.contains(key.stringValue) {
            fields[key.stringValue] = try dynamic.decode(BcValue.self, forKey: key)
        }
        customFields = fields
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(customTableId, forKey: .customTableId)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(parentId, forKey: .parentId)
        try container.encodeIfPresent(lft, forKey: .lft)
        try container.encodeIfPresent(rght, forKey: .rght)
        try container.encodeIfPresent(level, forKey: .level)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(publishBegin, forKey: .publishBegin)
        try container.encodeIfPresent(publishEnd, forKey: .publishEnd)
        try container.encodeIfPresent(published, forKey: .published)
        try container.encodeIfPresent(creatorId, forKey: .creatorId)
        try container.encodeIfPresent(created, forKey: .created)
        try container.encodeIfPresent(modified, forKey: .modified)

        var dynamic = encoder.container(keyedBy: BcCodingKey.self)
        for (key, value) in customFields {
            try dynamic.encode(value, forKey: BcCodingKey(key))
        }
    }

    // MARK: - カスタムフィールドアクセサー

    /// カスタムフィールド値を取得する
    public subscript(field: String) -> BcValue? {
        customFields[field]
    }

    /// カスタムフィールド値を文字列として取得する
    public func string(_ field: String) -> String? {
        customFields[field]?.stringValue
    }

    /// カスタムフィールド値を整数として取得する
    public func int(_ field: String) -> Int? {
        customFields[field]?.intValue
    }

    /// カスタムフィールド値を浮動小数点数として取得する
    public func double(_ field: String) -> Double? {
        customFields[field]?.doubleValue
    }

    /// カスタムフィールド値を真偽値として取得する
    public func bool(_ field: String) -> Bool? {
        customFields[field]?.boolValue
    }
}
