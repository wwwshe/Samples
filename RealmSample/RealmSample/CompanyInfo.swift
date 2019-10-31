//
//  Specimen.swift
//  RealmSample
//
//  Created by jungwook on 2019/10/25.
//  Copyright © 2019 jungwook. All rights reserved.
//

import Foundation
import RealmSwift


@objcMembers class CompanyInfo: Object, NSCopying {
    dynamic var id: Int = 0
    dynamic var name: String? = nil
    dynamic var address: String? = nil
    dynamic var tel: String? = nil
    dynamic var fax: String? = nil

    func copy(with zone: NSZone? = nil) -> Any {
        let copy = CompanyInfo()
        copy.name = self.name;
        copy.address = self.address;
        copy.tel = self.tel;
        copy.fax = self.fax;
        return copy
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}
