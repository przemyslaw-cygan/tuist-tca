import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Common",
    targets: [
        .target(
            name: "Common",
            destinations: ENV.DESTINATIONS,
            product: .framework,
            bundleId: "\(ENV.BUNDLE_ID).Common",
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
            ]
        ),
        .target(
            name: "CommonTests",
            destinations: ENV.DESTINATIONS,
            product: .unitTests,
            bundleId: "\(ENV.BUNDLE_ID).CommonTests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "Common")
            ]
        ),
    ]
)
