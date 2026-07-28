//
// Extensions.swift
// Copyright (c) 2021 Paul Schifferer.
//

import Fluent
import Vapor


public extension EventLoopFuture where Value : User {
    func convertToPublic() -> EventLoopFuture<User.Public> {
        map { user in
            user.convertToPublic()
        }
    }
}

public extension Collection where Element : User {
    func convertToPublic() -> [User.Public] {
        map {
            $0.convertToPublic()
        }
    }
}

public extension EventLoopFuture where Value == [User] {
    func convertToPublic() -> EventLoopFuture<[User.Public]> {
        map {
            $0.convertToPublic()
        }
    }
}
