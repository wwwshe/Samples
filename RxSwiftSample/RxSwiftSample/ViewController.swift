//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let allCities = ["NewYork", "London", "Paris", "Osaka", "Osagu", "Seoul"]
    var shownCities = [String]()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        searchBar.rx.text.orEmpty
            .subscribe(onNext : { [unowned self] query in
                self.shownCities = self.allCities.filter({$0.hasPrefix(query)})
                self.tableView.reloadData()
            })
        .disposed(by: disposeBag)
        
        
    }


}

