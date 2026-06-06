import Foundation

/// GET .../blog_posts/index.json のレスポンス
struct BlogPostsIndexResponse: Decodable {
    let blogPosts: [BlogPost]?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogPosts = "blogPosts"
        case message
    }
}

/// GET .../blog_posts/view/{id}.json のレスポンス
struct BlogPostViewResponse: Decodable {
    let blogPost: BlogPost?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogPost = "blogPost"
        case message
    }
}

/// POST .../blog_posts/add.json のリクエスト
struct BlogPostAddRequest: Encodable {
    let blogContentId: Int
    let no: Int?
    let name: String?
    let title: String
    let content: String?
    let detail: String?
    let blogCategoryId: Int?
    let userId: Int
    /// 0: 非公開, 1: 公開, 2: 予約公開
    let status: Int
    let posted: String?
    /// JSON エンコード対象外（multipart ファイルパートとして送信）
    let eyeCatch: BlogPostEyeCatch?

    enum CodingKeys: String, CodingKey {
        case blogContentId = "blog_content_id"
        case no, name, title, content, detail
        case blogCategoryId = "blog_category_id"
        case userId = "user_id"
        case status, posted
    }
}

/// アイキャッチ画像のファイルデータ
struct BlogPostEyeCatch {
    let data: Data
    let fileName: String
    let mimeType: String
}

/// POST .../blog_posts/add.json のレスポンス
struct BlogPostAddResponse: Decodable {
    let blogPost: BlogPost?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogPost = "blogPost"
        case message
    }
}

/// POST .../blog_posts/edit/{id}.json のリクエスト
struct BlogPostEditRequest: Encodable {
    let blogContentId: Int
    let no: Int?
    let name: String?
    let title: String
    let content: String?
    let detail: String?
    let blogCategoryId: Int?
    let userId: Int
    /// 0: 非公開, 1: 公開, 2: 予約公開
    let status: Int
    let posted: String?
    /// JSON エンコード対象外（multipart ファイルパートとして送信）
    let eyeCatch: BlogPostEyeCatch?

    enum CodingKeys: String, CodingKey {
        case blogContentId = "blog_content_id"
        case no, name, title, content, detail
        case blogCategoryId = "blog_category_id"
        case userId = "user_id"
        case status, posted
    }
}

/// POST .../blog_posts/edit/{id}.json のレスポンス
struct BlogPostEditResponse: Decodable {
    let blogPost: BlogPost?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogPost = "blogPost"
        case message
    }
}
