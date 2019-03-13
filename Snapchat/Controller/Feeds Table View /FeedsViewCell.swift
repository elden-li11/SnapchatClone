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
    @IBOutlet weak var unreadImage: UIImageView!
    var imageName: String = ""
    var feedName: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        unreadImage.image = UIImage(named: "unread")
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
