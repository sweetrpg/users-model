//
// UserRole+Versions.swift
//

import Fluent

extension UserRole {
  public enum v20260728 {
    // schema
    public static let schemaName = "user_roles"

    // properties
    public static let id = FieldKey(stringLiteral: "id")
    public static let userId = FieldKey(stringLiteral: "userId")
    public static let role = FieldKey(stringLiteral: "role")
    public static let createdAt = FieldKey(stringLiteral: "createdAt")
  }
}
