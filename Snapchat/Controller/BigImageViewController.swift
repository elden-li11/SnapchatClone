//
//  BigImageViewController.swift
//  Snapchat
//
//  Created by Elden Li on 3/12/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class BigImageViewController: UIViewController {
    var imageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(imageName)
        bigImage.setImage(UIImage(named: imageName), for: UIControl.State.normal)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var bigImage: UIButton!
    
    @IBAction func imagePressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
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
