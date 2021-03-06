//
//  ViewController.swift
//  Snapchat
//
//  Created by Arman Vaziri on 3/11/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FeedsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var imageSelected = ""
    let data = Data()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedStates.imagesPosted[data.feeds[section]]!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.feeds.count
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Feeds label", for: indexPath) as? FeedsViewCell {
            let feedName: String = data.feeds[indexPath.section]
            if let posts = FeedStates.imagesPosted[feedName] {
                let post = posts[indexPath.row]
                cell.personLabel.text = post.user
                cell.feedName = post.feed
                cell.opened = post.opened
                if (cell.opened == false) {
                    cell.imageName = "unread"
                }
                if (cell.opened == true) {
                    cell.imageName = "read"
                }
                cell.timestampLabel.text = post.timeSincePost()
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let db = Firestore.firestore()
        let feedName: String = data.feeds[indexPath.section]
        let currImage = FeedStates.imagesPosted[feedName]![indexPath.row]
        if !currImage.opened {
            FeedStates.imagesPosted[feedName]![indexPath.row].opened = true
            db.collection("snaps").document(currImage.imageName).setData([
                "seen": true
            ], merge: true) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            performSegue(withIdentifier: "enlargeImage", sender: currImage)
        } else {
            alreadyOpenedAlert()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? BigImageViewController {
            if var cell = sender as? imageState {
                dest.imageName = cell.imageName
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
    
//    func retrieveSnapFromDB(_ document: String) -> imageState {
//        let db = Firestore.firestore()
//        let docRef = db.collection("snaps").document(document)
//        
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data()!
//                return imageState.init(
//                    dataDescription["user"] as! String,
//                    dataDescription["image name"] as! String,
//                    dataDescription["time"] as! Date,
//                    dataDescription["feed"] as! String
//                )
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
}
