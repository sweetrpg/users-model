//
// ServiceDenyEntry+Versions.swift
//

import Fluent

extension ServiceDenyEntry {
  public enum v20260728 {
    // schema
    public static let schemaName = "service_deny_entries"

    // properties
    public static let id = FieldKey(stringLiteral: "id")
    public static let userId = FieldKey(stringLiteral: "userId")
    public static let service = FieldKey(stringLiteral: "service")
    public static let createdAt = FieldKey(stringLiteral: "createdAt")
  }
}
