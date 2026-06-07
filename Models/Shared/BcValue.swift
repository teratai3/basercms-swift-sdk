import Foundation

/// JSON の任意の値を表す型
/// カスタムエントリーのカスタムフィールドなど、スキーマが動的な値の受け渡しに使用する
public enum BcValue: Codable, Equatable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case array([BcValue])
    case object([String: BcValue])
    case null

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self = .null
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode(Int.self) {
            self = .int(value)
        } else if let value = try? container.decode(Double.self) {
            self = .double(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([BcValue].self) {
            self = .array(value)
        } else if let value = try? container.decode([String: BcValue].self) {
            self = .object(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "JSON 値としてデコードできませんでした"
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .string(value):
            try container.encode(value)
        case let .int(value):
            try container.encode(value)
        case let .double(value):
            try container.encode(value)
        case let .bool(value):
            try container.encode(value)
        case let .array(value):
            try container.encode(value)
        case let .object(value):
            try container.encode(value)
        case .null:
            try container.encodeNil()
        }
    }

    /// 文字列として取り出す（数値・真偽値は文字列に変換する）
    public var stringValue: String? {
        switch self {
        case let .string(value): return value
        case let .int(value): return String(value)
        case let .double(value): return String(value)
        case let .bool(value): return value ? "1" : "0"
        case .array, .object, .null: return nil
        }
    }

    /// 整数として取り出す（"5" などの数値文字列もパースする）
    public var intValue: Int? {
        switch self {
        case let .int(value): return value
        case let .double(value): return Int(value)
        case let .string(value): return Int(value)
        case let .bool(value): return value ? 1 : 0
        case .array, .object, .null: return nil
        }
    }

    /// 浮動小数点数として取り出す（数値文字列もパースする）
    public var doubleValue: Double? {
        switch self {
        case let .double(value): return value
        case let .int(value): return Double(value)
        case let .string(value): return Double(value)
        case .bool, .array, .object, .null: return nil
        }
    }

    /// 真偽値として取り出す（1/0・"true"/"false" なども解釈する）
    public var boolValue: Bool? {
        switch self {
        case let .bool(value):
            return value
        case let .int(value):
            return value != 0
        case let .string(value):
            switch value.lowercased() {
            case "1", "true": return true
            case "0", "false", "": return false
            default: return nil
            }
        case .double, .array, .object, .null:
            return nil
        }
    }
}

// MARK: - リテラル変換

extension BcValue: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension BcValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .int(value)
    }
}

extension BcValue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .double(value)
    }
}

extension BcValue: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}

extension BcValue: ExpressibleByNilLiteral {
    public init(nilLiteral _: ()) {
        self = .null
    }
}

/// 動的なキー名を扱うための CodingKey
public struct BcCodingKey: CodingKey {
    public let stringValue: String
    public var intValue: Int? {
        nil
    }

    public init?(stringValue: String) {
        self.stringValue = stringValue
    }

    public init?(intValue _: Int) {
        return nil
    }

    /// 文字列から直接生成する
    public init(_ stringValue: String) {
        self.stringValue = stringValue
    }
}
