// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Shooter",
    products: [],
    dependencies: [
        // add your dependencies here, for example:
        // .package(url: "https://github.com/User/Project.git", .upToNextMajor(from: "1.0.0")),
//        .package(url: "https://github.com/MihaelIsaev/CodyFire.git", .upToNextMajor(from: "1.0.0"))
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "4.1.0"))
    ],
    targets: [
        .target(
            name: "Shooter",
            dependencies: [
                // add your dependencies scheme names here, for example:
                // "Project",
                "Alamofire"
            ],
            path: "Shooter"
        ),
    ]
)
