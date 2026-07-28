// swift-tools-version:5.4

import PackageDescription


let package = Package(
        name: "sweetrpg-users-model",
        platforms: [
            .macOS(.v10_15),
        ],
        products: [
            .library(name: "UserModel", targets: [ "UserModel" ])
        ],
        dependencies: [
            // 💧 A server-side Swift web framework.
            .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
            .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        ],
        targets: [
            .target(
                    name: "UserModel",
                    dependencies: [
                        .product(name: "Fluent", package: "fluent"),
                        .product(name: "Vapor", package: "vapor"),
                    ],
                    swiftSettings: [
                        // Enable better optimizations when building in Release configuration. Despite the use of
                        // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                        // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                        .unsafeFlags([ "-cross-module-optimization" ], .when(configuration: .release)),
                    ]
            ),
            .testTarget(name: "UserModelTests", dependencies: [
                .target(name: "UserModel"),
                .product(name: "XCTVapor", package: "vapor"),
            ]),
        ]
)
