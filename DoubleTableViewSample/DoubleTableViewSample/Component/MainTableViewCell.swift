//
//  MainTableViewCell.swift
//  DoubleTableViewSample
//
//  Created by jungwook on 2019/10/30.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    var datas = [TempData]()
    @IBOutlet weak var tableView: SelfSizedTableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
        tableView.delegate = self
        tableView.dataSource = self
      
        tableView.tableFooterView  = UIView()
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.layer.borderWidth = 1
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension MainTableViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCell") as! SubTableViewCell
        let name = datas[indexPath.row].name
        let content = datas[indexPath.row].content
        
        cell.nameLabel.text = name
        cell.contentLabel.text = content
     
        return cell
    }
    
   

}

