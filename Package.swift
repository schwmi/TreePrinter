// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TreePrinter",
    products: [
        .library(
            name: "TreePrinter",
            targets: ["TreePrinter"]),
    ],
    targets: [
        .target(
            name: "TreePrinter",
            dependencies: []),
        .testTarget(
            name: "TreePrinterTests",
            dependencies: ["TreePrinter"]),
    ]
)
