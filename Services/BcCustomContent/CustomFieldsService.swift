import Foundation

/// カスタムフィールド関連の API を扱うサービス
struct CustomFieldsService {
    let client: ApiClient

    /// カスタムフィールド一覧を取得する
    /// - Returns: カスタムフィールドの配列（該当なしの場合は空配列）
    func getCustomFields() async throws -> [CustomField] {
        let res: CustomFieldsIndexResponse = try await client.getIndex(route: .customFields)
        return res.customFields ?? []
    }

    /// 単一カスタムフィールドを取得する
    /// - Parameter id: カスタムフィールド ID
    /// - Returns: 該当するカスタムフィールド
    func getCustomField(id: Int) async throws -> CustomField {
        let res: CustomFieldViewResponse = try await client.getView(route: .customFields, id: id)
        guard let customField = res.customField else {
            throw BcError.notFound(resource: "カスタムフィールド", identifier: String(id))
        }
        return customField
    }

    /// カスタムフィールドを追加する
    /// - Parameter request: 追加するカスタムフィールドの情報
    /// - Returns: 追加したカスタムフィールド
    func addCustomField(_ request: CustomFieldAddRequest) async throws -> CustomField {
        let res: CustomFieldAddResponse = try await client.add(route: .customFields, data: request)
        guard let customField = res.customField else {
            throw BcError.notFound(resource: "カスタムフィールド", identifier: request.name)
        }
        return customField
    }

    /// カスタムフィールドを編集する
    /// - Parameters:
    ///   - id: カスタムフィールド ID
    ///   - request: 編集するカスタムフィールドの情報
    /// - Returns: 編集したカスタムフィールド
    func editCustomField(id: Int, _ request: CustomFieldEditRequest) async throws -> CustomField {
        let res: CustomFieldEditResponse = try await client.edit(route: .customFields, id: id, data: request)
        guard let customField = res.customField else {
            throw BcError.notFound(resource: "カスタムフィールド", identifier: String(id))
        }
        return customField
    }

    /// カスタムフィールドを削除する
    /// - Parameter id: カスタムフィールド ID
    func deleteCustomField(id: Int) async throws {
        try await client.delete(route: .customFields, id: id)
    }
}
