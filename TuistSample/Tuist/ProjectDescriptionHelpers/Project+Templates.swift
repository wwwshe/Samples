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
        organization: String,
        deploymentTarget: DeploymentTarget
    ) -> Project {
        let targetTypes: [TargetType] = [
            .app
        ]
        
        let targets = targetTypes.map {
            makeTargets(
                type: $0,
                platform: platform,
                organization: organization,
                deploymentTarget: deploymentTarget
            )
        }
        
        return Project(
            name: name,
            organizationName: organization,
            options: .options(
                disableBundleAccessors: true,
                disableSynthesizedResourceAccessors: true
            ),
            packages: [
                .local(path: "Packages")
            ],
            targets: targets,
            resourceSynthesizers: []
        )
    }

    private static func makeTargets(
        type: TargetType,
        platform: Platform,
        organization: String,
        deploymentTarget: DeploymentTarget
    ) -> Target {
        return Target(
            name: type.name,
            platform: platform,
            product: .app,
            bundleId: "\(organization)\(type.name)",
            deploymentTarget: deploymentTarget,
            infoPlist: type.plist,
            sources: ["\(type.name)/Sources/**"],
            resources: ["\(type.name)/Resources/**"],
            dependencies: type.dependencies
        )
    }
    
    private func makeScheme(type: TargetType) -> Scheme {
        return Scheme(
            name: type.name,
            shared: true,
            buildAction: .buildAction(
                targets: [
                ]
            ),
            testAction: .testPlans([]),
            runAction: .runAction(configuration: .debug),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .debug),
            analyzeAction: .analyzeAction(configuration: .debug)
        )
    }
}
