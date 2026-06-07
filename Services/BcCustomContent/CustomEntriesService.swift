import Foundation

/// カスタムエントリー関連の API を扱うサービス
/// 全操作で custom_table_id クエリパラメーターが必須
public struct CustomEntriesService {
    private let client: ApiClient

    /// コンストラクタ
    public init(client: ApiClient) {
        self.client = client
    }

    private func tableQuery(_ customTableId: Int) -> [String: String] {
        ["custom_table_id": String(customTableId)]
    }

    /// カスタムエントリー一覧を取得する
    /// - Parameter customTableId: カスタムテーブル ID
    /// - Returns: カスタムエントリーの配列（該当なしの場合は空配列）
    public func getCustomEntries(customTableId: Int) async throws -> [CustomEntry] {
        let res: CustomEntriesIndexResponse = try await client.getIndex(
            route: .customEntries,
            query: tableQuery(customTableId)
        )
        return res.entries ?? []
    }

    /// 単一カスタムエントリーを取得する
    /// - Parameters:
    ///   - id: カスタムエントリー ID
    ///   - customTableId: カスタムテーブル ID
    /// - Returns: 該当するカスタムエントリー
    public func getCustomEntry(id: Int, customTableId: Int) async throws -> CustomEntry {
        let res: CustomEntryViewResponse = try await client.getView(
            route: .customEntries,
            id: id,
            query: tableQuery(customTableId)
        )
        guard let entry = res.entry else {
            throw BcError.notFound(resource: "カスタムエントリー", identifier: String(id))
        }
        return entry
    }

    /// カスタムエントリーを追加する
    /// - Parameters:
    ///   - request: 追加するカスタムエントリーの情報
    ///   - customTableId: カスタムテーブル ID
    ///   - files: アップロードするファイルの配列（カスタムフィールドの画像など）
    /// - Returns: 追加したカスタムエントリー
    public func addCustomEntry(
        _ request: CustomEntryAddRequest,
        customTableId: Int,
        files: [(name: String, data: Data, fileName: String, mimeType: String)] = []
    ) async throws -> CustomEntry {
        let res: CustomEntryAddResponse = try await client.add(
            route: .customEntries,
            data: request,
            files: files,
            query: tableQuery(customTableId)
        )
        guard let entry = res.entry else {
            throw BcError.notFound(resource: "カスタムエントリー", identifier: request.title)
        }
        return entry
    }

    /// カスタムエントリーを編集する
    /// - Parameters:
    ///   - id: カスタムエントリー ID
    ///   - request: 編集するカスタムエントリーの情報
    ///   - customTableId: カスタムテーブル ID
    ///   - files: アップロードするファイルの配列（カスタムフィールドの画像など）
    /// - Returns: 編集したカスタムエントリー
    public func editCustomEntry(
        id: Int,
        _ request: CustomEntryEditRequest,
        customTableId: Int,
        files: [(name: String, data: Data, fileName: String, mimeType: String)] = []
    ) async throws -> CustomEntry {
        let res: CustomEntryEditResponse = try await client.edit(
            route: .customEntries,
            id: id,
            data: request,
            files: files,
            query: tableQuery(customTableId)
        )
        guard let entry = res.entry else {
            throw BcError.notFound(resource: "カスタムエントリー", identifier: String(id))
        }
        return entry
    }

    /// カスタムエントリーを削除する
    /// - Parameters:
    ///   - id: カスタムエントリー ID
    ///   - customTableId: カスタムテーブル ID
    public func deleteCustomEntry(id: Int, customTableId: Int) async throws {
        try await client.delete(
            route: .customEntries,
            id: id,
            query: tableQuery(customTableId)
        )
    }
}
