import Foundation

/// カスタムリンク関連の API を扱うサービス
/// 一覧取得には custom_table_id クエリパラメーターが必須
struct CustomLinksService {
    let client: ApiClient

    private func tableQuery(_ customTableId: Int) -> [String: String] {
        ["custom_table_id": String(customTableId)]
    }

    /// カスタムリンク一覧を取得する
    /// - Parameter customTableId: カスタムテーブル ID
    /// - Returns: カスタムリンクの配列（該当なしの場合は空配列）
    func getCustomLinks(customTableId: Int) async throws -> [CustomLink] {
        let res: CustomLinksIndexResponse = try await client.getIndex(
            route: .customLinks,
            query: tableQuery(customTableId)
        )
        return res.customLinks ?? []
    }

    /// 単一カスタムリンクを取得する
    /// - Parameter id: カスタムリンク ID
    /// - Returns: 該当するカスタムリンク
    func getCustomLink(id: Int) async throws -> CustomLink {
        let res: CustomLinkViewResponse = try await client.getView(route: .customLinks, id: id)
        guard let customLink = res.customLink else {
            throw BcError.notFound(resource: "カスタムリンク", identifier: String(id))
        }
        return customLink
    }

    /// カスタムリンクを追加する
    /// - Parameter request: 追加するカスタムリンクの情報
    /// - Returns: 追加したカスタムリンク
    /// - Note: カスタムエントリーテーブルへのカラム追加を伴う
    func addCustomLink(_ request: CustomLinkAddRequest) async throws -> CustomLink {
        let res: CustomLinkAddResponse = try await client.add(route: .customLinks, data: request)
        guard let customLink = res.customLink else {
            throw BcError.notFound(resource: "カスタムリンク", identifier: request.name)
        }
        return customLink
    }

    /// カスタムリンクを編集する
    /// - Parameters:
    ///   - id: カスタムリンク ID
    ///   - request: 編集するカスタムリンクの情報
    /// - Returns: 編集したカスタムリンク
    /// - Note: name を変更するとカスタムエントリーテーブルのカラム名も変更される
    func editCustomLink(id: Int, _ request: CustomLinkEditRequest) async throws -> CustomLink {
        let res: CustomLinkEditResponse = try await client.edit(route: .customLinks, id: id, data: request)
        guard let customLink = res.customLink else {
            throw BcError.notFound(resource: "カスタムリンク", identifier: String(id))
        }
        return customLink
    }

    /// カスタムリンクを削除する
    /// - Parameter id: カスタムリンク ID
    /// - Note: カスタムエントリーテーブルから対応カラムも削除される
    func deleteCustomLink(id: Int) async throws {
        try await client.delete(route: .customLinks, id: id)
    }
}
