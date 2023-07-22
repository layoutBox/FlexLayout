// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FlexLayout",
  products: [
    .library(name: "FlexLayout", targets: ["FlexLayout"]),
    .library(name: "FlexLayoutBinary", targets: ["FlexLayoutBinary"]),
    .library(name: "FlexLayoutYoga", targets: ["FlexLayoutYoga"]),
    .library(name: "FlexLayoutYogaKit", targets: ["FlexLayoutYogaKit"])
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "FlexLayout",
      dependencies: ["FlexLayoutYoga", "FlexLayoutYogaKit"],
      path: "Sources/Swift",
      cSettings: [
        .define("FLEXLAYOUT_SWIFT_PACKAGE")
      ],
      cxxSettings: [
        .define("FLEXLAYOUT_SWIFT_PACKAGE"),
        .headerSearchPath("include/yoga/"),
        .headerSearchPath("./")
      ],
      swiftSettings: [
        .define("FLEXLAYOUT_SWIFT_PACKAGE")
      ]
    ),
    .binaryTarget(
      name: "FlexLayoutBinary",
      url: "https://github.com/woohyunjin06/FlexLayout/releases/download/1.3.33/FlexLayout.xcframework.zip",
      checksum: "9e81b4565e20cfed0d1c15ebfda181cd068f568fb1a2d627b407e96349eafe76"
    ),
    .target(
      name: "FlexLayoutYoga",
      dependencies: [],
      path: "Sources/yoga",
      cSettings: [
        .define("FLEXLAYOUT_SWIFT_PACKAGE")
      ],
      cxxSettings: [
        .define("FLEXLAYOUT_SWIFT_PACKAGE"),
        .headerSearchPath("include/yoga/"),
        .headerSearchPath("./")
      ]
    ),
    .target(
      name: "FlexLayoutYogaKit",
      dependencies: ["FlexLayoutYoga"],
      path: "Sources/YogaKit",
      cSettings: [
        .define("FLEXLAYOUT_SWIFT_PACKAGE")
      ],
      cxxSettings: [
        .define("FLEXLAYOUT_SWIFT_PACKAGE"),
        .headerSearchPath("include/YogaKit/"),
        .headerSearchPath("./")
      ]
    )
  ],
  cLanguageStandard: .gnu99,
  cxxLanguageStandard: .gnucxx11
)
