//
//  CustomTableViewCell.swift
//  Network Demo Usage
//
//  Created by Harun Fazlic on 7. 6. 2022..
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var cellBackround: UIView!
    @IBOutlet var circleView: UIView!
    @IBOutlet var boldLabel: UILabel!
    @IBOutlet var regularLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        circleView.layer.cornerRadius = circleView.frame.width/2
        
    }
}
