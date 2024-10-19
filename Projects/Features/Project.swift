import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Features",
    targets:  [
        .target(
            name: "Features",
            destinations: ENV.DESTINATIONS,
            product: .framework,
            bundleId: "\(ENV.BUNDLE_ID).Features",
            sources: [],
            dependencies: FEATURES.map { name in .target(name: "Feature-\(name)")}
        ),
    ] + FEATURES.flatMap { name in [
        .target(
            name: "Feature-\(name)",
            destinations: ENV.DESTINATIONS,
            product: .framework,
            bundleId: "\(ENV.BUNDLE_ID).Feature.\(name)",
            sources: ["Feature-\(name)/Sources/**"],
            dependencies: [
                .project(target: "Common", path: .relativeToRoot("Projects/Common"))
            ]
        ),
        .target(
            name: "Feature-\(name)Tests",
            destinations: ENV.DESTINATIONS,
            product: .unitTests,
            bundleId: "\(ENV.BUNDLE_ID).Feature.\(name)Tests",
            sources: ["Feature-\(name)/Tests/**"],
            dependencies: [
                .target(name: "Feature-\(name)")
            ]
        ),
    ] }
)
