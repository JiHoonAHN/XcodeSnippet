// swift-tools-version: 5.7
 
import PackageDescription

let package = Package(
    name: "XcodeSnippet",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "XcodeSnippet", targets: ["XcodeSnippet"]),
        .executable(name: "xcodeSnippet-cli", targets: ["XcodeSnippetCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/files.git", from: "4.2.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.3.0")
    ],
    targets: [
        .target(
            name: "XcodeSnippet",
            dependencies: [
                .product(name: "Files", package: "files"),
                .product(name: "ShellOut", package: "ShellOut")
            ]
        ),
        .executableTarget(
            name: "XcodeSnippetCLI",
            dependencies: ["XcodeSnippetCLICore"]),
        .target(
            name: "XcodeSnippetCLICore",
            dependencies: ["XcodeSnippet"]
        ),
        .testTarget(
            name: "XcodeSnippetTests",
            dependencies: ["XcodeSnippet", "XcodeSnippetCLICore"]),
    ]
)
