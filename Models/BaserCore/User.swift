/// ユーザーモデル
public struct User: Codable {
    /// ユーザーID
    public let id: Int

    /// ユーザー名
    public let name: String?

    /// ユーザー名（実名1）
    public let realName1: String

    /// ユーザー名（実名2）
    public let realName2: String?

    /// メールアドレス
    public let email: String

    /// ニックネーム
    public let nickname: String?

    /// 作成日時
    public let created: String?

    /// 更新日時
    public let modified: String?

    /// ステータス
    public let status: Bool

    public let userGroups: [UserGroup]?

    /// コーディングキー
    enum CodingKeys: String, CodingKey {
        case id, name, email, nickname, created, modified, status
        case realName1 = "real_name_1"
        case realName2 = "real_name_2"
        case userGroups = "user_groups"
    }
}

/// ユーザーグループモデル
public struct UserGroup: Codable {
    /// ユーザーID
    public let id: Int

    /// ユーザー名
    public let name: String

    /// タイトル
    public let title: String

    /// 認証プレフィックス
    public let authPrefix: String

    /// 認証プレフィックス設定
    public let authPrefixSettings: String

    /// 使用移動コンテンツ
    public let useMoveContents: Bool

    /// 作成日時
    public let created: String?

    /// 更新日時
    public let modified: String?

    /// ユーザーグループデータ
    public let joinData: UserGroupJoinData?

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
public struct UserGroupJoinData: Codable {
    /// ユーザーグループID
    public let id: Int

    /// ユーザーID
    public let userId: Int

    /// ユーザーグループID
    public let userGroupId: Int

    /// 作成日時
    public let created: String?

    /// 更新日時
    public let modified: String?

    /// コーディングキー
    enum CodingKeys: String, CodingKey {
        case id, created, modified
        case userId = "user_id"
        case userGroupId = "user_group_id"
    }
}
