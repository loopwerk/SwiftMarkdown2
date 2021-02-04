// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "SwiftMarkdown2",
  products: [
    .library(
      name: "SwiftMarkdown2",
      targets: ["SwiftMarkdown2"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pvieito/PythonKit.git", from: "0.1.0"),
  ],
  targets: [
    .target(
      name: "SwiftMarkdown2",
      dependencies: ["PythonKit"]),
    .testTarget(
      name: "SwiftMarkdown2Tests",
      dependencies: ["SwiftMarkdown2"]),
  ]
)
