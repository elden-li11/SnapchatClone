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
        return data.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Feeds label", for: indexPath) as? FeedsViewCell {
            if let personLabel = cell.personLabel {
                personLabel.text = data.feeds[indexPath.row]
                print("did it")
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "enlargeImage", sender: tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "enlargeImage" {
                if let dest = segue.destination as? BigImageViewController {
                    dest.imageName = "waves"
                }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
