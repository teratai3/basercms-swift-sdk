import Foundation

/// GET .../blog_tags/index.json のレスポンス
public struct BlogTagsIndexResponse: Decodable {
    public let blogTags: [BlogTag]?
    public let message: String?
}

/// GET .../blog_tags/view/{id}.json のレスポンス
public struct BlogTagViewResponse: Decodable {
    public let blogTag: BlogTag?
    public let message: String?
}

/// POST .../blog_tags/add.json のリクエスト
public struct BlogTagAddRequest: Encodable {
    public let name: String

    /// コンストラクタ
    public init(
        name: String
    ) {
        self.name = name
    }
}

/// POST .../blog_tags/add.json のレスポンス
public struct BlogTagAddResponse: Decodable {
    public let blogTag: BlogTag?
    public let message: String?
}

/// POST .../blog_tags/edit/{id}.json のリクエスト
public struct BlogTagEditRequest: Encodable {
    public let name: String

    /// コンストラクタ
    public init(
        name: String
    ) {
        self.name = name
    }
}

/// POST .../blog_tags/edit/{id}.json のレスポンス
public struct BlogTagEditResponse: Decodable {
    public let blogTag: BlogTag?
    public let message: String?
}
