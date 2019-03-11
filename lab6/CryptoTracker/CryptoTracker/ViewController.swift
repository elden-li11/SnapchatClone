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
    
    
    @IBOutlet weak var currencySelect: UISegmentedControl!
    
    @IBAction func currencySelectAction(_ sender: Any) {
        
    }
    
    @IBAction func refreshButtonTouched(_ sender: Any) {
    }
    
    
    let theData = Data.init()
    let red = UIColor.red
    let green = UIColor.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchDataJSON()
    }
    
    func fetchDataJSON() {
        guard let url = URL(string: "https://api.cryptonator.com/api/ticker/btc-usd") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let data = data else {return}
                do {
                    let decoded = try JSONDecoder().decode(Crypto.self, from: data)
                    DispatchQueue.main.async {
                        self.symbolLabel.text = decoded.ticker["base"]
                        self.nameLabel.text = self.theData.cryptoData[decoded.ticker["base"]!]
                        let target: String = self.theData.currencyData[decoded.ticker["target"]!]!
                        let stringPrice: String = decoded.ticker["price"]!
                        let doubledPrice: Double = Double(stringPrice)!
                        let price = String(format: "%.2f", doubledPrice)
                        self.priceLabel.text = (target + price)
                        let stringChange: String = decoded.ticker["change"]!
                        let doubledChange: Double = Double(stringChange)!
                        let change = String(format: "%.4f", doubledChange)
                        self.changeLabel.text = change + "%"
                        if doubledChange < 0 {
                            self.changeLabel.textColor = self.red
                        }
                        else {
                            self.changeLabel.textColor = self.green
                        }
                    }
                } catch let jsonError {
                    print("Error serializing JSON: ", jsonError)
                }
            }
        }
        task.resume()
    }
    



}

struct Crypto: Decodable {
    let ticker: [String: String]
    let timestamp: Int
    let success: Bool
}


