import ProjectDescription

let name: Template.Attribute = .required("name")

let template = Template(
    description: "Feature template",
    attributes: [
        name,
    ],
    items: [
        .file(
            path: "Projects/Features/Feature-\(name)/Sources/Reducer.swift",
            templatePath: "Stencil/Reducer.stencil"
        ),
        .file(
            path: "Projects/Features/Feature-\(name)/Sources/ScreenView.swift",
            templatePath: "Stencil/ScreenView.stencil"
        ),
        .file(
            path: "Projects/Features/Feature-\(name)/Tests/Tests.swift",
            templatePath: "Stencil/Tests.stencil"
        )
    ]
)
