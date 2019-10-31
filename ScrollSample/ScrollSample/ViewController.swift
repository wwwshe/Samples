//
//  ViewController.swift
//  ScrollSample
//
//  Created by jungwook on 2019/10/31.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageVIewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        scrollView.bounces = false
        tableView.bounces = false
        self.tableView.layer.borderColor = UIColor.black.cgColor
        self.tableView.layer.borderWidth = 1
        self.scrollView.delegate = self
    
        self.tableViewHeight.constant =  40 * 20
        print(scrollView.contentSize)
        print(mainView.frame.size)
        print(tableView.frame.size)
    }
    
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tempCell") as! TempTableCell
        cell.tempLabel.text = "index : \(indexPath.row)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if imageVIewHeight.constant == 100 {
            imageVIewHeight.constant = 0
        }else{
            imageVIewHeight.constant = 100
        }
    }
}

class TempTableCell : UITableViewCell{
    
    @IBOutlet weak var tempLabel: UILabel!
    
}
