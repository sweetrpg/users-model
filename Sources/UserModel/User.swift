//
// User.swift
// Copyright (c) 2021 Paul Schifferer.
//

import Fluent
import Vapor


public final class User : Model {
    public static let schema = User.v20210620.schemaName

    @ID
    public var id : UUID?

    @Timestamp(key: User.v20210620.createdAt, on: .create)
    public var createdAt : Date?

    @Timestamp(key: User.v20210620.updatedAt, on: .update)
    public var updatedAt : Date?

    @Field(key: User.v20210620.name)
    public var name : String

    @Children(for: \.$user)
    public var loginProfiles : [LoginProfile]

    @Children(for: \.$user)
    public var settingsItems : [SettingsItem]

    @Timestamp(key: User.v20210620.deletedAt, on: .delete)
    public var deletedAt : Date?

    @Field(key: User.v20210620.email)
    public var email : String

    public init() {
    }

    public init(id : UUID? = nil, name : String,
                email : String) {
        self.id = id
        self.name = name
        self.email = email
    }

    public final class Public : Content {
        var id : UUID?
        var name : String

        init(id : UUID?, name : String) {
            self.id = id
            self.name = name
        }
    }
}

extension User : Content {}

public extension User {
    func convertToPublic() -> User.Public {
        User.Public(id: self.id, name: self.name)
    }
}

extension User : ModelSessionAuthenticatable {}
