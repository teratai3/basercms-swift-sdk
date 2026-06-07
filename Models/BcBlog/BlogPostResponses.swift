import Foundation

/// GET .../blog_posts/index.json のレスポンス
public struct BlogPostsIndexResponse: Decodable {
    public let blogPosts: [BlogPost]?
    public let message: String?
}

/// GET .../blog_posts/view/{id}.json のレスポンス
public struct BlogPostViewResponse: Decodable {
    public let blogPost: BlogPost?
    public let message: String?
}

/// POST .../blog_posts/add.json のリクエスト
public struct BlogPostAddRequest: Encodable {
    public let blogContentId: Int
    public let no: Int?
    public let name: String?
    public let title: String
    public let content: String?
    public let detail: String?
    public let blogCategoryId: Int?
    public let userId: Int
    /// 0: 非公開, 1: 公開, 2: 予約公開
    public let status: Int
    public let posted: String?
    /// JSON エンコード対象外（multipart ファイルパートとして送信）
    public let eyeCatch: BlogPostEyeCatch?

    enum CodingKeys: String, CodingKey {
        case blogContentId = "blog_content_id"
        case no, name, title, content, detail
        case blogCategoryId = "blog_category_id"
        case userId = "user_id"
        case status, posted
    }

    /// コンストラクタ
    public init(
        blogContentId: Int,
        no: Int? = nil,
        name: String? = nil,
        title: String,
        content: String? = nil,
        detail: String? = nil,
        blogCategoryId: Int? = nil,
        userId: Int,
        status: Int,
        posted: String? = nil,
        eyeCatch: BlogPostEyeCatch? = nil
    ) {
        self.blogContentId = blogContentId
        self.no = no
        self.name = name
        self.title = title
        self.content = content
        self.detail = detail
        self.blogCategoryId = blogCategoryId
        self.userId = userId
        self.status = status
        self.posted = posted
        self.eyeCatch = eyeCatch
    }
}

/// アイキャッチ画像のファイルデータ
public struct BlogPostEyeCatch {
    public let data: Data
    public let fileName: String
    public let mimeType: String

    /// コンストラクタ
    public init(
        data: Data,
        fileName: String,
        mimeType: String
    ) {
        self.data = data
        self.fileName = fileName
        self.mimeType = mimeType
    }
}

/// POST .../blog_posts/add.json のレスポンス
public struct BlogPostAddResponse: Decodable {
    public let blogPost: BlogPost?
    public let message: String?
}

/// POST .../blog_posts/edit/{id}.json のリクエスト
public struct BlogPostEditRequest: Encodable {
    public let blogContentId: Int
    public let no: Int?
    public let name: String?
    public let title: String
    public let content: String?
    public let detail: String?
    public let blogCategoryId: Int?
    public let userId: Int
    /// 0: 非公開, 1: 公開, 2: 予約公開
    public let status: Int
    public let posted: String?
    /// JSON エンコード対象外（multipart ファイルパートとして送信）
    public let eyeCatch: BlogPostEyeCatch?

    enum CodingKeys: String, CodingKey {
        case blogContentId = "blog_content_id"
        case no, name, title, content, detail
        case blogCategoryId = "blog_category_id"
        case userId = "user_id"
        case status, posted
    }

    /// コンストラクタ
    public init(
        blogContentId: Int,
        no: Int? = nil,
        name: String? = nil,
        title: String,
        content: String? = nil,
        detail: String? = nil,
        blogCategoryId: Int? = nil,
        userId: Int,
        status: Int,
        posted: String? = nil,
        eyeCatch: BlogPostEyeCatch? = nil
    ) {
        self.blogContentId = blogContentId
        self.no = no
        self.name = name
        self.title = title
        self.content = content
        self.detail = detail
        self.blogCategoryId = blogCategoryId
        self.userId = userId
        self.status = status
        self.posted = posted
        self.eyeCatch = eyeCatch
    }
}

/// POST .../blog_posts/edit/{id}.json のレスポンス
public struct BlogPostEditResponse: Decodable {
    public let blogPost: BlogPost?
    public let message: String?
}
