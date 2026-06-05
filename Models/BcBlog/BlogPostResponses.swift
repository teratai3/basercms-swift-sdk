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
