// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BaserCMS",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "BaserCMS",
            targets: ["BaserCMS"]
        ),
    ],
    targets: [
        .target(
            name: "BaserCMS",
            path: ".",
            exclude: ["README.md"]
        ),
    ]
)
