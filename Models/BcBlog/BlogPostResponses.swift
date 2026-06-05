/// GET .../blog_posts/index.json のレスポンス
struct BlogPostsIndexResponse: Decodable {
    let blogPosts: [BlogPost]?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case blogPosts = "blogPosts"
        case message
    }
}
