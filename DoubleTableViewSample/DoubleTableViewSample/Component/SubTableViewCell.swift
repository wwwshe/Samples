//
//  SubTableViewCell.swift
//  DoubleTableViewSample
//
//  Created by jungwook on 2019/10/30.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit

class SubTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
         
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
