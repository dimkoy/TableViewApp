//
//  MyRestrauntTableViewCell.swift
//  tableViewApplication
//
//  Created by Dmitriy on 17/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import UIKit

class MyRestrauntTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
