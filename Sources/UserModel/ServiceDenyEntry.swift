//
// ServiceDenyEntry.swift
//

import Fluent
import Vapor

/// An explicit deny of one user's access to one service. Absence of a row means access is
/// allowed - see design.md's "Per-service access: default-allow + deny-list" decision.
public final class ServiceDenyEntry: Model {
  public static let schema = ServiceDenyEntry.v20260728.schemaName

  @ID
  public var id: UUID?

  @Timestamp(key: ServiceDenyEntry.v20260728.createdAt, on: .create)
  public var createdAt: Date?

  @Parent(key: ServiceDenyEntry.v20260728.userId)
  public var user: User

  @Field(key: ServiceDenyEntry.v20260728.service)
  public var service: String

  public init() {}

  public init(id: UUID? = nil, userId: User.IDValue, service: String) {
    self.id = id
    self.$user.id = userId
    self.service = service
  }
}

extension ServiceDenyEntry: Content {}
