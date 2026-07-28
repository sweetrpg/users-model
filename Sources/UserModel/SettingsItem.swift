//
// SettingsItem.swift
// Copyright (c) 2021 Paul Schifferer.
//

import Fluent
import Vapor


public final class SettingsItem : Model {
    public static let schema = SettingsItem.v20210622.schemaName

    @ID
    public var id : UUID?

    @Timestamp(key: SettingsItem.v20210622.createdAt, on: .create)
    public var createdAt : Date?

    @Timestamp(key: SettingsItem.v20210622.updatedAt, on: .update)
    public var updatedAt : Date?

    @Timestamp(key: SettingsItem.v20210622.deletedAt, on: .delete)
    public var deletedAt : Date?

    @Field(key: SettingsItem.v20210622.name)
    public var name : String

    @Field(key: SettingsItem.v20210622.value)
    public var value : String

    @Parent(key: SettingsItem.v20210622.userId)
    public var user : User

    public init() {
    }

    public init(id : UUID? = nil, name : String, value : String, userId : User.IDValue) {
        self.id = id
        self.name = name
        self.value = value
        self.$user.id = userId
    }
}

extension SettingsItem : Content {}
