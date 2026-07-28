//
// Created by Paul Schifferer on 6/16/21.
//

import Fluent


public extension SettingsItem {
    public enum v20210622 {
        // schema
        public static let schemaName = "settings_items"

        // properties
        public static let id = FieldKey(stringLiteral: "id")
        public static let userId = FieldKey(stringLiteral: "userId")
        public static let name = FieldKey(stringLiteral: "name")
        public static let value = FieldKey(stringLiteral: "value")
        public static let deletedAt = FieldKey(stringLiteral: "deletedAt")
        public static let createdAt = FieldKey(stringLiteral: "createdAt")
        public static let updatedAt = FieldKey(stringLiteral: "updatedAt")
    }
}
