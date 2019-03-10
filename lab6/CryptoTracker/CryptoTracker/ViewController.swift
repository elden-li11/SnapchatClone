//
//  ViewController.swift
//  CryptoTracker
//
//  Created by David [Entei] Xiong on 3/7/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    let data = Data.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchAndDisplay()
    }

    func fetchAndDisplay() {
        symbolLabel.text = data.cryptoData["Bitcoin"]
        nameLabel.text = data.cryptoNames[0]
        priceLabel.text = data.currencyData["USD"] // + the price from api
    
    }
    
    
}

