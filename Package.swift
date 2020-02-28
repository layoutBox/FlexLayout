// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FlexLayout",
  platforms: [
    .iOS(.v11)
  ],
  products: [
    .library(name: "FlexLayout", targets: ["FlexLayout"]),
    .library(name: "FlexLayoutYoga", targets: ["FlexLayoutYoga"]),
    .library(name: "FlexLayoutYogaKit", targets: ["FlexLayoutYogaKit"])
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "FlexLayout",
      dependencies: ["FlexLayoutYoga", "FlexLayoutYogaKit"],
      path: "Sources/Swift"
    ),
    .target(
      name: "FlexLayoutYoga",
      dependencies: [],
      path: "Sources/yoga",
      cxxSettings: [
        .define("SWIFT_PACKAGE"),
        .headerSearchPath("include/yoga/"),
        .headerSearchPath("./")
      ]
    ),
    .target(
      name: "FlexLayoutYogaKit",
      dependencies: ["FlexLayoutYoga"],
      path: "Sources/YogaKit",
      cxxSettings: [
        .define("SWIFT_PACKAGE"),
        .headerSearchPath("include/YogaKit/"),
        .headerSearchPath("./")
      ]
    )
  ],
  cLanguageStandard: .gnu99,
  cxxLanguageStandard: .gnucxx11
)
