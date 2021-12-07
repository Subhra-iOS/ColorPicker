// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorPicker",
    platforms: [
        .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ColorPicker",
            targets: ["ColorPicker",
                      "ARCHueColorPickerDataModel",
                      "CheckMarkControls",
                      "Extension",
                      "Managers",
                      "Model",
                      "Paths",
                      "Protocol",
                      "Util",
                      "View"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ColorPicker",
            dependencies: ["ARCHueColorPickerDataModel",
                           "CheckMarkControls",
                           "Extension",
                           "Managers",
                           "Model",
                           "Paths",
                           "Protocol",
                           "Util",
                           "View",
            ]),
        .target(name: "ARCHueColorPickerDataModel",
                dependencies: []),
        .target(name: "CheckMarkControls",
                dependencies: []),
        .target(name: "Extension",
                dependencies: []),
        .target(name: "Managers",
                dependencies: []),
        .target(name: "Model",
                dependencies: []),
        .target(name: "Paths",
                dependencies: []),
        .target(name: "Protocol",
                dependencies: []),
        .target(name: "Util",
                dependencies: []),
        .target(name: "View",
                dependencies: []),
        .testTarget(
            name: "ColorPickerTests",
            dependencies: ["ColorPicker",
                           "ARCHueColorPickerDataModel",
                           "CheckMarkControls",
                           "Extension",
                           "Managers",
                           "Model",
                           "Paths",
                           "Protocol",
                           "Util",
                           "View"]),
    ]
)
