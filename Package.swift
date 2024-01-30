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
            url: "https://wultra.jfrog.io/artifactory/proximity-transfer-apple-release/WultraProximityTransfer-1.0.0.xcframework.zip",
            checksum: "e89df5a7ae820338e5c1cb8f798d26520270657c38068ac2ef9647d052956cc0"
        )
    ],
    swiftLanguageVersions: [.v5]
)
