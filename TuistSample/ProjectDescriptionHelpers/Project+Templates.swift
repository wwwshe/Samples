import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(
        name: String,
        platform: Platform,
        organizationName: String,
        packages: [Package],
        dependencies: [TargetDependency],
        deploymentTarget: DeploymentTarget
    ) -> Project {
        var targets = makeAppTargets(
            name: name,
            platform: platform,
            organizationName: organizationName,
            dependencies: dependencies,
            deploymentTarget: deploymentTarget
        )
        return Project(
            name: name,
            organizationName: organizationName,
            options: .options(
                disableBundleAccessors: true
            ),
            packages: packages,
            targets: targets,
            resourceSynthesizers: []
        )
    }
    
    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(
        name: String,
        platform: Platform,
        organizationName: String,
        dependencies: [TargetDependency],
        deploymentTarget: DeploymentTarget
    ) -> [Target] {
        let platform: Platform = platform
        
        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: .file(path: "InfoPlists/\(name)-Info.plist"),
            sources: ["\(name)/Sources/**"],
            resources: ["\(name)/Resources/**"],
            scripts: [.post(path: "Script/Swiftlint.sh",
                            name: "Run Script Swiftlint",
                            basedOnDependencyAnalysis: false)],
            dependencies: dependencies
        )
        
        return [mainTarget]
    }
}
