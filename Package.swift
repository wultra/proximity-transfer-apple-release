// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "WultraProximityTransfer",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12)
    ],
    products: [
        .library(
            name: "WultraProximityTransfer",
            targets: ["WultraProximityTransfer"])
    ],
    targets: [
        .binaryTarget(
            name: "WultraProximityTransfer",
            url: "https://wultra.jfrog.io/artifactory/proximity-transfer-apple-release/WultraProximityTransfer-1.0.1.xcframework.zip",
            checksum: "e7ae64ed758d91bff0f57429d2994b506beb1c283ac076b525dcdfe6cbd28d9b"
        )
    ],
    swiftLanguageVersions: [.v5]
)
