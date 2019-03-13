//
//  FeedsViewCellTableViewCell.swift
//  Snapchat
//
//  Created by Arman Vaziri on 3/11/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class FeedsViewCell: UITableViewCell {
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var imageStatus: UIImageView!
    var imageName: String = ""
    var feedName: String = ""
    var opened: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if !opened {
            imageStatus.image = UIImage(named: "unread")
        } else {
            imageStatus.image = UIImage(named: "read")
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
