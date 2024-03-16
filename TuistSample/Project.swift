import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project


// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(
    name: "App",
    platform: .iOS,
    organization: "burdock-jjw",
    deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone)
)
