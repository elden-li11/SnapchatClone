//
//  FeedPickerViewController.swift
//  Snapchat
//
//  Created by Elden Li on 3/3/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class FeedPickerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var feedPickerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        feedPickerTableView.rowHeight = 70
        self.title = "Feeds"
        feedPickerTableView.delegate = self
        feedPickerTableView.dataSource = self
        postImageLabel.text = "Posting image: " + imageName
        print(postImageLabel.text!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FeedPickerLabel", for: indexPath) as? FeedPickerViewCell {
            if let feedLabel = cell.feedLabel {
                feedLabel.text = data.feeds[indexPath.row]
                print("YEE")
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(data.feeds[indexPath.row])")
        toFeedLabel.text = "To feed: " + data.feeds[indexPath.row]
    }
    
    let data = Data()
    var imageName: String = ""
    
    @IBOutlet weak var postImageLabel: UILabel!
    @IBOutlet weak var toFeedLabel: UILabel!
}
