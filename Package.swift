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
            url: "https://wultra.jfrog.io/artifactory/proximity-transfer-apple-release/WultraProximityTransfer-0.9.9.xcframework.zip",
            checksum: "2d3b6a26d32c7f2ebaef3fa00cfb095dcf0a1b629803ffed661518652b908902"
        )
    ],
    swiftLanguageVersions: [.v5]
)
