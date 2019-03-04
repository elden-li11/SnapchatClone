//
//  FeedPickerViewController.swift
//  Snapchat
//
//  Created by Elden Li on 3/3/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class FeedPickerViewController: UIViewController {
    
    var imageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        postImageLabel.text = "Posting image: " + imageName
        print(postImageLabel.text!)
    }
    
    @IBOutlet weak var postImageLabel: UILabel!
    @IBOutlet weak var toFeedLabel: UILabel!
}
