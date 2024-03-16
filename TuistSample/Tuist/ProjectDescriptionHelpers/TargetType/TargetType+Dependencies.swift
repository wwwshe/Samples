//
//  TargetType+Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by jun wook on 3/16/24.
//

import ProjectDescription

extension TargetType {
    var dependencies: [TargetDependency] {
        switch self {
        case .app:
            return [
                .package(product: "Packages")
            ]
        }
    }
}
