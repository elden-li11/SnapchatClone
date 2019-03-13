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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedStates.imagesPosted.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Feeds label", for: indexPath) as? FeedsViewCell {
            
            let currImage = FeedStates.imagesPosted[indexPath.row]
            cell.imageName = currImage.name
            cell.timestampLabel.text = String(currImage.timestamp.description)
            cell.feedName = currImage.feed
            cell.opened = currImage.opened
            cell.personLabel.text = "Arman and Elden"
            print("updated cell")
            print(FeedStates.imagesPosted)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currImage = FeedStates.imagesPosted[indexPath.row]
        FeedStates.imagesPosted[indexPath.row].opened = true
        performSegue(withIdentifier: "enlargeImage", sender: currImage.name)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? BigImageViewController {
            if let cell = sender as? String {
                dest.imageName = cell
            }
        }
    }
    
    
    @IBOutlet weak var feedsTableView: UITableView!
    
    let data = Data.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        feedsTableView.rowHeight = 70
        feedsTableView.delegate = self
        feedsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.feedsTableView.reloadData()
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
