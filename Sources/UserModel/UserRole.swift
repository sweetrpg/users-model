//
// UserRole.swift
//

import Fluent
import Vapor

/// A single role assignment. A user with no rows here defaults to `Role.user` (see
/// `design.md`'s "Role model" decision) - this table only holds assignments beyond that default.
public final class UserRole: Model {
  public static let schema = UserRole.v20260728.schemaName

  @ID
  public var id: UUID?

  @Timestamp(key: UserRole.v20260728.createdAt, on: .create)
  public var createdAt: Date?

  @Parent(key: UserRole.v20260728.userId)
  public var user: User

  @Field(key: UserRole.v20260728.role)
  public var role: Role

  public init() {}

  public init(id: UUID? = nil, userId: User.IDValue, role: Role) {
    self.id = id
    self.$user.id = userId
    self.role = role
  }
}

extension UserRole: Content {}
