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
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FeedPickerLabel", for: indexPath) as? FeedPickerViewCell {
            if let feedLabel = cell.feedLabel {
                feedLabel.text = data.feeds[indexPath.row]
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedSelected = true
        toFeedLabel.text = "To feed: " + data.feeds[indexPath.row]
        feedName = data.feeds[indexPath.row]
    }
    
    let data = Data()
    var imageName: String = ""
    var feedName: String = ""
    var feedSelected: Bool = false
    
    @IBOutlet weak var postImageLabel: UILabel!
    @IBOutlet weak var toFeedLabel: UILabel!
    
    @IBAction func sendButtonSelected(_ sender: Any) {
        if !feedSelected {
            noFeedAlert()
        } else {
            feedSentAlert()
        }
    }
    
    func noFeedAlert() {
        let alertController = UIAlertController(title: "Error", message: "You need to select a feed.", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Understood", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func feedSentAlert() {
        let alertController = UIAlertController(title: "Successful", message: "You've sent " + imageName + " to " + feedName + ".", preferredStyle: UIAlertController.Style.alert)
        let backToImagesAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction!) -> Void in
            _ = self.navigationController!.popToRootViewController(animated: true)
            FeedStates.feeds[self.feedName]!.append(self.imageName)
        }
        alertController.addAction(backToImagesAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
