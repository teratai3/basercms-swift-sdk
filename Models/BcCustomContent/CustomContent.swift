/// カスタムコンテンツモデル
public struct CustomContent: Codable {
    public let id: Int
    public let customTableId: Int?
    public let description: String?
    public let template: String?
    public let widgetArea: Int?
    public let listCount: Int?
    public let listOrder: String?
    public let listDirection: String?
    public let created: String?
    public let modified: String?
    public let content: ContentDetail?

    enum CodingKeys: String, CodingKey {
        case id, description, template, created, modified, content
        case customTableId = "custom_table_id"
        case widgetArea = "widget_area"
        case listCount = "list_count"
        case listOrder = "list_order"
        case listDirection = "list_direction"
    }
}
