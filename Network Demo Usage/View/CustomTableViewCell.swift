//
//  CustomTableViewCell.swift
//  Network Demo Usage
//
//  Created by Harun Fazlic on 7. 6. 2022..
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var infoButton: UIButton!
    @IBOutlet var circleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        infoButton.tintColor = .lightGray
        circleButton.layer.cornerRadius = circleButton.frame.width/2
        circleButton.layer.masksToBounds = true
        
    }
    
}
