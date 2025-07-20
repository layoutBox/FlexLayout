// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FlexLayout",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(name: "FlexLayout", targets: ["FlexLayout"]),
  ],
  dependencies: [
    .package(url: "https://github.com/facebook/yoga.git", .upToNextMinor(from: "3.2.1")),
  ],
  targets: [
    .target(
      name: "FlexLayout",
      dependencies: ["FlexLayoutYogaKit"],
      path: "Sources/Swift",
      publicHeadersPath: "Public"
    ),
    .target(
      name: "FlexLayoutYogaKit",
      dependencies: ["yoga"],
      path: "Sources/YogaKit",
      publicHeadersPath: "include/YogaKit"
    ),
    .testTarget(
      name: "FlexLayoutTests",
      dependencies: [
        "FlexLayout",
      ]
    ),
  ],
  cxxLanguageStandard: CXXLanguageStandard(rawValue: "c++20")
)
