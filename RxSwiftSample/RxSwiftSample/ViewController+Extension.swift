//
//  ViewController+Extension.swift
//  RxSwiftSample
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = shownCities[indexPath.row]
        return cell
    }
}
