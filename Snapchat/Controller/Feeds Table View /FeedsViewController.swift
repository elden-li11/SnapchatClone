//
//  ViewController.swift
//  Snapchat
//
//  Created by Arman Vaziri on 3/11/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var imageSelected = ""
    let data = Data()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedStates.imagesPosted.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let data = Data()
        switch section {
        case 0: return data.feeds[0]
        case 1: return data.feeds[1]
        case 2: return data.feeds[2]
        case 3: return data.feeds[3]
        case 4: return data.feeds[4]
        case 5: return data.feeds[5]
        default: break
        }
        return String(section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Feeds label", for: indexPath) as? FeedsViewCell {
            let currImage = FeedStates.imagesPosted[indexPath.row]
            print(FeedStates.imagesPosted)
            cell.opened = currImage.opened
            if (cell.opened == false) {
                cell.imageName = "unread"
            }
            if (cell.opened == true) {
                cell.imageName = "read"
            }
            cell.timestampLabel.text = String(currImage.timestamp.description)
            cell.feedName = currImage.feed
            cell.personLabel.text = "Arman and Elden"
            print("updated cell")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currImage = FeedStates.imagesPosted[indexPath.row]
        if !currImage.opened {
            FeedStates.imagesPosted[indexPath.row].opened = true
            performSegue(withIdentifier: "enlargeImage", sender: currImage)
        } else {
            alreadyOpenedAlert()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? BigImageViewController {
            if var cell = sender as? imageState {
                dest.imageName = cell.name
                cell.opened = true
            }
        }
    }
    
    
    @IBOutlet weak var feedsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        feedsTableView.rowHeight = 70
        feedsTableView.delegate = self
        feedsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.feedsTableView.reloadData()
    }
    
    func alreadyOpenedAlert() {
        let alertController = UIAlertController(title: "Oops.", message: "You've already opened this snap.", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Understood", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
