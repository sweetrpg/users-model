//
// LoginProfile.swift
// Copyright (c) 2021 Paul Schifferer.
//

import Fluent
import Vapor


public final class LoginProfile : Model {
    public static let schema = LoginProfile.v20210620.schemaName

    @ID
    public var id : UUID?

    @Timestamp(key: LoginProfile.v20210620.createdAt, on: .create)
    public var createdAt : Date?

    @Timestamp(key: LoginProfile.v20210620.updatedAt, on: .update)
    public var updatedAt : Date?

    @Timestamp(key: LoginProfile.v20210620.deletedAt, on: .delete)
    public var deletedAt : Date?

    @Parent(key: LoginProfile.v20210620.userId)
    public var user : User

    @Field(key: LoginProfile.v20210620.username)
    public var username : String

    @Field(key: LoginProfile.v20210620.thirdPartyAuth)
    public var thirdPartyAuth : String

    @Field(key: LoginProfile.v20210620.thirdPartyAuthId)
    public var thirdPartyAuthId : String

    public init() {
    }

    public init(id : UUID? = nil, username : String,
                thirdPartyAuth : String, thirdPartyAuthId : String,
                userId : User.IDValue) {
        self.id = id
        self.username = username
        self.thirdPartyAuth = thirdPartyAuth
        self.thirdPartyAuthId = thirdPartyAuthId
        self.$user.id = userId
    }
}

extension LoginProfile : Content {}
