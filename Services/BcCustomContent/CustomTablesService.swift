import Foundation

/// カスタムテーブル関連の API を扱うサービス
public struct CustomTablesService {
    public let client: ApiClient

    /// コンストラクタ
    public init(client: ApiClient) {
        self.client = client
    }

    /// カスタムテーブル一覧を取得する
    /// - Returns: カスタムテーブルの配列（該当なしの場合は空配列）
    public func getCustomTables() async throws -> [CustomTable] {
        let res: CustomTablesIndexResponse = try await client.getIndex(route: .customTables)
        return res.customTables ?? []
    }

    /// 単一カスタムテーブルを取得する
    /// - Parameter id: カスタムテーブル ID
    /// - Returns: 該当するカスタムテーブル
    public func getCustomTable(id: Int) async throws -> CustomTable {
        let res: CustomTableViewResponse = try await client.getView(route: .customTables, id: id)
        guard let customTable = res.customTable else {
            throw BcError.notFound(resource: "カスタムテーブル", identifier: String(id))
        }
        return customTable
    }

    /// カスタムテーブルを追加する
    /// - Parameter request: 追加するカスタムテーブルの情報
    /// - Returns: 追加したカスタムテーブル
    public func addCustomTable(_ request: CustomTableAddRequest) async throws -> CustomTable {
        let res: CustomTableAddResponse = try await client.add(route: .customTables, data: request)
        guard let customTable = res.customTable else {
            throw BcError.notFound(resource: "カスタムテーブル", identifier: request.name)
        }
        return customTable
    }

    /// カスタムテーブルを編集する
    /// - Parameters:
    ///   - id: カスタムテーブル ID
    ///   - request: 編集するカスタムテーブルの情報
    /// - Returns: 編集したカスタムテーブル
    public func editCustomTable(id: Int, _ request: CustomTableEditRequest) async throws -> CustomTable {
        let res: CustomTableEditResponse = try await client.edit(route: .customTables, id: id, data: request)
        guard let customTable = res.customTable else {
            throw BcError.notFound(resource: "カスタムテーブル", identifier: String(id))
        }
        return customTable
    }

    /// カスタムテーブルを削除する
    /// - Parameter id: カスタムテーブル ID
    public func deleteCustomTable(id: Int) async throws {
        try await client.delete(route: .customTables, id: id)
    }
}
