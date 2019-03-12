//
//  ViewController.swift
//  Snapchat
//
//  Created by Arman Vaziri on 3/11/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "Feeds label", for: indexPath) as? FeedsViewCell {
//            if let cellLabel = cell.textLabel {
//
//            }
//            return cell
//        }
        return UITableViewCell()
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
