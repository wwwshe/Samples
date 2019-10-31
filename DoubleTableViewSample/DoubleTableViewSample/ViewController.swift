//
//  ViewController.swift
//  DoubleTableViewSample
//
//  Created by jungwook on 2019/10/30.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var datas = [[TempData]]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView  = UIView()
        
        for _ in 0..<10{
            datas.append(createDatas())
        }
        
    }
    func createDatas()->[TempData]{
           var data = [TempData]()
           let tempStrings = ["123",
                              "You can use the random(in:) function to get random values for several primitive types, such as Int, Double, Float and even Bool. Like this:",
                              "You can use the random(in:) function to get random values for several primitive types, such as Int, Double, Float and even Bool. Like this:",
                              "123",
                              "123",
                              "You can use the random(in:) function to get random values for several primitive types, such as Int, Double, Float and even Bool. Like this:",
                              "You can use the random(in:) function to get random values for several primitive types, such as Int, Double, Float and even Bool. Like this:",
                              "123",
                              "123",
                              "You can use the random(in:) function to get random values for several primitive types, such as Int, Double, Float and even Bool. Like this:"
           ]
           let random = Int.random(in: 1..<10)
          
           for i in 0..<random{
               data.append(TempData(name: "테스트\(i)", content: tempStrings[i]))
           }
       
           return data
       }
    
}



extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! MainTableViewCell
        cell.datas = datas[indexPath.row]
        cell.tableView.reloadData()
        return cell
    }
  
   
}
