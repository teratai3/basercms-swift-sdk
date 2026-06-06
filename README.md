# baserCMS Swift SDK

baserCMS の管理 API を Swift から操作するためのライブラリです。

## 動作要件

- Swift 5.9+
- iOS 15+ / macOS 12+
- baserCMS 5.x

## インストール

### Swift Package Manager

**Xcode の場合：**
`File > Add Package Dependencies` でリポジトリの URL を入力してください。

**`Package.swift` がある場合：**

```swift
dependencies: [
    .package(url: "https://github.com/teratai3/basercms-swift-sdk.git", from: "1.0.0")
],
targets: [
    .target(name: "MyApp", dependencies: ["BaserCMS"])
]
```

## セットアップ

### ApiClient の生成とログイン

```swift
guard let baseURL = URL(string: "https://example.com") else { return }
let client = ApiClient(baseURL: baseURL)

try await client.login(email: "admin@example.com", password: "password")
```

ログイン後、取得したアクセストークンは `ApiClient` 内部で保持されます。
以降の API 呼び出しにはトークンが自動付与されます。

---

## 認証

### トークンのリフレッシュ

アクセストークン（有効期限 30 分）が期限切れになった場合、リフレッシュトークンで更新できます。

```swift
try await client.refreshAccessToken()
```

### ログアウト

メモリ上のトークンをクリアします。

```swift
client.logout()
```

---

## ユーザー

```swift
let service = UserService(client: client)
```

### 一覧取得

```swift
let users = try await service.getUsers()
```

### 単一取得

```swift
let user = try await service.getUser(id: 1)
```

### メールアドレスで検索

```swift
let user = try await service.getUserByEmail(email: "user@example.com")
```

### 追加

```swift
let user = try await service.addUser(
    UserAddRequest(
        name: "newuser",
        password1: "Password123456",
        password2: "Password123456",
        realName1: "山田",
        realName2: "太郎",
        email: "newuser@example.com",
        nickname: "やまだ",
        userGroupIds: [1],
        status: true
    )
)
```

### 編集

```swift
let user = try await service.editUser(
    id: 1,
    UserEditRequest(
        realName1: "田中",
        email: "updated@example.com",
        status: true
    )
)
```

### 削除

```swift
try await service.deleteUser(id: 1)
```

---

## ブログ記事

```swift
let service = BlogPostsService(client: client)
```

### 一覧取得

```swift
let posts = try await service.getBlogPosts()
```

### 単一取得

```swift
let post = try await service.getBlogPost(id: 1)
```

### 追加

アイキャッチ画像は `BlogPostEyeCatch` で指定します。省略可能です。

```swift
let post = try await service.addBlogPost(
    BlogPostAddRequest(
        blogContentId: 1,
        no: nil,
        name: "my-post",
        title: "記事タイトル",
        content: "本文",
        detail: "詳細",
        blogCategoryId: 1,
        userId: 1,
        status: 1,
        posted: "2025-07-01 12:00:00",
        eyeCatch: BlogPostEyeCatch(
            data: imageData,
            fileName: "image.jpg",
            mimeType: "image/jpeg"
        )
    )
)
```

### 編集

```swift
let post = try await service.editBlogPost(
    id: 1,
    BlogPostEditRequest(
        blogContentId: 1,
        no: nil,
        name: nil,
        title: "編集後タイトル",
        content: "編集後本文",
        detail: nil,
        blogCategoryId: nil,
        userId: 1,
        status: 1,
        posted: nil,
        eyeCatch: nil
    )
)
```

### 削除

```swift
try await service.deleteBlogPost(id: 1)
```

---

## ブログカテゴリ

```swift
let service = BlogCategoriesService(client: client)

let categories = try await service.getBlogCategories()
let category  = try await service.getBlogCategory(id: 1)
let added     = try await service.addBlogCategory(BlogCategoryAddRequest(...))
let updated   = try await service.editBlogCategory(id: 1, BlogCategoryEditRequest(...))
try await service.deleteBlogCategory(id: 1)
```

---

## ブログタグ

```swift
let service = BlogTagsService(client: client)

let tags    = try await service.getBlogTags()
let tag     = try await service.getBlogTag(id: 1)
let added   = try await service.addBlogTag(BlogTagAddRequest(name: "new-tag"))
let updated = try await service.editBlogTag(id: 1, BlogTagEditRequest(name: "updated-tag"))
try await service.deleteBlogTag(id: 1)
```

---

## ブログコンテンツ

```swift
let service = BlogContentsService(client: client)

let contents = try await service.getBlogContents()
let content  = try await service.getBlogContent(id: 1)
let added    = try await service.addBlogContent(BlogContentAddRequest(...))
let updated  = try await service.editBlogContent(id: 1, BlogContentEditRequest(...))
try await service.deleteBlogContent(id: 1)
```

---

## カスタムテーブル

```swift
let service = CustomTablesService(client: client)

let tables  = try await service.getCustomTables()
let table   = try await service.getCustomTable(id: 1)
let added   = try await service.addCustomTable(CustomTableAddRequest(...))
let updated = try await service.editCustomTable(id: 1, CustomTableEditRequest(...))
try await service.deleteCustomTable(id: 1)
```

---

## カスタムフィールド

```swift
let service = CustomFieldsService(client: client)

let fields  = try await service.getCustomFields()
let field   = try await service.getCustomField(id: 1)
let added   = try await service.addCustomField(
    CustomFieldAddRequest(name: "fieldA", title: "フィールドA", type: "BcCcText", status: true)
)
let updated = try await service.editCustomField(
    id: 1,
    CustomFieldEditRequest(name: nil, title: "更新済み", type: nil, status: true)
)
try await service.deleteCustomField(id: 1)
```

---

## カスタムリンク

カスタムテーブルとカスタムフィールドを紐付けます。リンクの追加・削除はエントリーテーブルのカラム追加・削除を伴います。

```swift
let service = CustomLinksService(client: client)
```

### 一覧取得（`custom_table_id` 必須）

```swift
let links = try await service.getCustomLinks(customTableId: 1)
```

### 単一取得

```swift
let link = try await service.getCustomLink(id: 1)
// link.customField でリンク先のフィールド情報を参照できます
```

### 追加

```swift
let link = try await service.addCustomLink(
    CustomLinkAddRequest(
        customTableId: 1,
        customFieldId: 1,
        name: "new_link",
        title: "新しいリンク",
        no: nil,
        parentId: nil,
        level: nil,
        lft: nil,
        rght: nil,
        description: nil,
        attention: nil,
        options: nil,
        cssClass: nil,
        groupValid: nil,
        beforeLinefeed: nil,
        afterLinefeed: nil,
        useLoop: nil,
        displayAdminList: true,
        displayFront: true,
        searchTargetAdmin: nil,
        searchTargetFront: nil,
        useApi: true,
        required: false,
        status: true
    )
)
```

### 編集

```swift
let link = try await service.editCustomLink(
    id: 1,
    CustomLinkEditRequest(
        name: nil,
        title: "更新されたリンク",
        no: nil,
        parentId: nil,
        description: nil,
        attention: nil,
        options: nil,
        cssClass: nil,
        groupValid: nil,
        beforeLinefeed: nil,
        afterLinefeed: nil,
        useLoop: nil,
        displayAdminList: nil,
        displayFront: nil,
        searchTargetAdmin: nil,
        searchTargetFront: nil,
        useApi: nil,
        required: nil,
        status: true
    )
)
```

### 削除

```swift
// 対応するエントリーテーブルのカラムも削除されます
try await service.deleteCustomLink(id: 1)
```

---

## カスタムエントリー

```swift
let service = CustomEntriesService(client: client)
```

### 一覧取得（`custom_table_id` 必須）

```swift
let entries = try await service.getCustomEntries(customTableId: 1)
```

### 単一取得

```swift
let entry = try await service.getCustomEntry(id: 1, customTableId: 1)
```

### 追加

ファイルフィールドがある場合は `files` パラメーターで渡します。

```swift
let entry = try await service.addCustomEntry(
    CustomEntryAddRequest(
        customTableId: 1,
        name: "entry-name",
        title: "エントリータイトル",
        status: true,
        creatorId: 1
    ),
    customTableId: 1,
    files: [
        (name: "product_image", data: imageData, fileName: "photo.jpg", mimeType: "image/jpeg")
    ]
)
```

### 編集

```swift
let entry = try await service.editCustomEntry(
    id: 1,
    CustomEntryEditRequest(
        customTableId: 1,
        name: nil,
        title: "編集後タイトル",
        status: true
    ),
    customTableId: 1
)
```

### 削除

```swift
try await service.deleteCustomEntry(id: 1, customTableId: 1)
```

---

## カスタムコンテンツ

```swift
let service = CustomContentsService(client: client)

let contents = try await service.getCustomContents()
let content  = try await service.getCustomContent(id: 1)
let added    = try await service.addCustomContent(CustomContentAddRequest(...))
let updated  = try await service.editCustomContent(id: 1, CustomContentEditRequest(...))
try await service.deleteCustomContent(id: 1)
```

---

## エラーハンドリング

すべての API メソッドは `BcError` を throw します。

```swift
do {
    let user = try await service.getUser(id: 999)
} catch BcError.notFound(let resource, let identifier) {
    print("\(resource) が見つかりません（\(identifier ?? "")）")
} catch BcError.httpError(let statusCode, let message) {
    print("HTTP \(statusCode): \(message ?? "")")
} catch BcError.authenticationFailed {
    // トークン期限切れ → リフレッシュして再試行
    try await client.refreshAccessToken()
} catch {
    print(error.localizedDescription)
}
```

| エラー | 説明 |
|--------|------|
| `authenticationFailed` | トークンがない、またはログイン前に API を呼び出した |
| `httpError(statusCode:message:)` | サーバーが 200 以外を返した |
| `notFound(resource:identifier:)` | レスポンスにデータが含まれていなかった |
| `invalidURL` | URL の組み立てに失敗した |
| `invalidResponse` | HTTP レスポンスが不正な形式だった |
