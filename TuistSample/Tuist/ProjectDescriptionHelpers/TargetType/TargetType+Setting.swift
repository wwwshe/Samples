//
//  TargetType+Setting.swift
//  ProjectDescriptionHelpers
//
//  Created by jun wook on 3/16/24.
//

import ProjectDescription

extension TargetType {
    var versionSetting: SettingsDictionary {
        return [
            "MARKETING_VERSION": "1.0.0",
            "CURRENT_PROJECT_VERSION": "1"
        ]
    }
    
    var settingDictionary: SettingsDictionary {
        switch self {
        case .app:
            return versionSetting
        }
    }
    
    var name: String {
        switch self {
        case .app:
            return "App"
        }
    }
    
    var settings: Settings {
        switch self {
        case .app:
            return .settings(base: settingDictionary, defaultSettings: .recommended)
        }
    }
    
    var plist: InfoPlist {
        switch self {
        case .app:
            return .file(path: "Plist/App-Info.plist")
        }
    }
}
