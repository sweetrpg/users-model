//
// Role.swift
//

/// The platform's fixed role model. A user may hold more than one role at once (e.g. `user`
/// and `editor`) - deliberately not a generic permissions matrix, see design.md's "Role model"
/// decision.
public enum Role: String, Codable, CaseIterable {
  case user
  case submitter
  case editor
  case moderator
  case approver
  case admin
}
