import Foundation

/// カスタムコンテンツ関連の API を扱うサービス
struct CustomContentsService {
    let client: ApiClient

    /// カスタムコンテンツ一覧を取得する
    /// - Returns: カスタムコンテンツの配列（該当なしの場合は空配列）
    func getCustomContents() async throws -> [CustomContent] {
        let res: CustomContentsIndexResponse = try await client.getIndex(route: .customContents)
        return res.customContents ?? []
    }

    /// 単一カスタムコンテンツを取得する
    /// - Parameter id: カスタムコンテンツ ID
    /// - Returns: 該当するカスタムコンテンツ
    func getCustomContent(id: Int) async throws -> CustomContent {
        let res: CustomContentViewResponse = try await client.getView(route: .customContents, id: id)
        guard let customContent = res.customContent else {
            throw BcError.notFound(resource: "カスタムコンテンツ", identifier: String(id))
        }
        return customContent
    }

    /// カスタムコンテンツを追加する
    /// - Parameter request: 追加するカスタムコンテンツの情報
    /// - Returns: 追加したカスタムコンテンツ
    func addCustomContent(_ request: CustomContentAddRequest) async throws -> CustomContent {
        let res: CustomContentAddResponse = try await client.add(route: .customContents, data: request)
        guard let customContent = res.customContent else {
            throw BcError.notFound(resource: "カスタムコンテンツ", identifier: String(request.customTableId))
        }
        return customContent
    }

    /// カスタムコンテンツを編集する
    /// - Parameters:
    ///   - id: カスタムコンテンツ ID
    ///   - request: 編集するカスタムコンテンツの情報
    /// - Returns: 編集したカスタムコンテンツ
    func editCustomContent(id: Int, _ request: CustomContentEditRequest) async throws -> CustomContent {
        let res: CustomContentEditResponse = try await client.edit(route: .customContents, id: id, data: request)
        guard let customContent = res.customContent else {
            throw BcError.notFound(resource: "カスタムコンテンツ", identifier: String(id))
        }
        return customContent
    }

    /// カスタムコンテンツを削除する
    /// - Parameter id: カスタムコンテンツ ID
    func deleteCustomContent(id: Int) async throws {
        try await client.delete(route: .customContents, id: id)
    }
}
