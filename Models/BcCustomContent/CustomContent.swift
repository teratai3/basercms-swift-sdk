/// カスタムコンテンツモデル
struct CustomContent: Codable {
    let id: Int
    let customTableId: Int?
    let description: String?
    let template: String?
    let widgetArea: Int?
    let listCount: Int?
    let listOrder: String?
    let listDirection: String?
    let created: String?
    let modified: String?
    let content: ContentDetail?

    enum CodingKeys: String, CodingKey {
        case id, description, template, created, modified, content
        case customTableId = "custom_table_id"
        case widgetArea = "widget_area"
        case listCount = "list_count"
        case listOrder = "list_order"
        case listDirection = "list_direction"
    }
}
