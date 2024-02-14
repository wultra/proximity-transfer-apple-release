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
            url: "https://wultra.jfrog.io/artifactory/proximity-transfer-apple-release/WultraProximityTransfer-1.0.2.xcframework.zip",
            checksum: "5be6fbd60ec804a275653fa94ff057ed2c7f3153976119c0e0ab5e7192c1fa7f"
        )
    ],
    swiftLanguageVersions: [.v5]
)
