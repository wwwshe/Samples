//
//  ViewController.swift
//  RealmSample
//
//  Created by jungwook on 2019/10/25.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        saveCompanyInfo()
        let realm = try! Realm()
        print(realm.objects(CompanyInfo.self))
        
    }

    func saveCompanyInfo(){
        let companyInfo : CompanyInfo = CompanyInfo()
        companyInfo.name = "회사"
        let realm = try! Realm()
        
        try! realm.write {
            realm.create(CompanyInfo.self, value : companyInfo, update: .modified)
            
            realm.add(companyInfo, update: .modified)
        }
        
        print("fileURL : \(Realm.Configuration.defaultConfiguration.fileURL!)")
    }

}

