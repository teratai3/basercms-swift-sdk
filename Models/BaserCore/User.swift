/// ユーザーモデル
struct User: Codable {

    /// ユーザーID
    let id: Int

    /// ユーザー名
    let name: String?

    /// ユーザー名（実名1）
    let realName1: String

    /// ユーザー名（実名2）
    let realName2: String?

    /// メールアドレス
    let email: String

    /// ニックネーム
    let nickname: String?

    /// 作成日時
    let created: String?

    /// 更新日時
    let modified: String?

    /// ステータス
    let status: Bool

    let userGroups: [UserGroup]?

    /// コーディングキー
    enum CodingKeys: String, CodingKey {
        case id, name, email, nickname, created, modified, status
        case realName1 = "real_name_1"
        case realName2 = "real_name_2"
        case userGroups = "user_groups"
    }
}

/// ユーザーグループモデル
struct UserGroup: Codable {

    /// ユーザーID
    let id: Int

    /// ユーザー名
    let name: String

    /// タイトル
    let title: String

    /// 認証プレフィックス
    let authPrefix: String

    /// 認証プレフィックス設定
    let authPrefixSettings: String

    /// 使用移動コンテンツ
    let useMoveContents: Bool

    /// 作成日時
    let created: String?

    /// 更新日時
    let modified: String?

    /// ユーザーグループデータ
    let joinData: UserGroupJoinData?

    /// コーディングキー
    enum CodingKeys: String, CodingKey {
        case id, name, title, created, modified
        case authPrefix = "auth_prefix"
        case authPrefixSettings = "auth_prefix_settings"
        case useMoveContents = "use_move_contents"
        case joinData = "_joinData"
    }
}

/// ユーザーグループデータ
struct UserGroupJoinData: Codable {

    /// ユーザーグループID
    let id: Int

    /// ユーザーID
    let userId: Int

    /// ユーザーグループID
    let userGroupId: Int

    /// 作成日時
    let created: String?

    /// 更新日時
    let modified: String?

    /// コーディングキー
    enum CodingKeys: String, CodingKey {
        case id, created, modified
        case userId = "user_id"
        case userGroupId = "user_group_id"
    }
}