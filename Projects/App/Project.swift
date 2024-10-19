import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "App",
    targets: [
        .target(
            name: "App",
            destinations: ENV.DESTINATIONS,
            product: .app,
            bundleId: "\(ENV.BUNDLE_ID)",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Features", path: .relativeToRoot("Projects/Features"))
            ]
        ),
    ]
)
