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
    
    var base: String = ""
    var target: String = ""
    
    @IBAction func currencySelectAction(_ sender: Any) {
        self.target = currencySelect.titleForSegment(at: currencySelect.selectedSegmentIndex)!
    }
    
    @IBAction func refreshButtonTouched(_ sender: Any) {
        fetchDataJSON(self.base, self.target)
    }
    
    
    let theData = Data.init()
    let red = UIColor.red
    let green = UIColor.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.base = "BTC"
        self.target = "USD"
        fetchDataJSON(self.base, self.target)
    }
    
    func fetchDataJSON(_ base: String, _ target: String) {
        guard let url = URL(string: "https://api.cryptonator.com/api/ticker/" + base + "-" + target) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let data = data else {return}
                do {
                    let decoded = try JSONDecoder().decode(Crypto.self, from: data)
                    DispatchQueue.main.async {
                        let base: String = decoded.ticker["base"]!
                        let symbol: String = self.theData.cryptoData[decoded.ticker["base"]!]!
                        let target: String = self.theData.currencyData[decoded.ticker["target"]!]!
                        let price: String = String(format: "%.2f", Double(decoded.ticker["price"]!)!)
                        let change: String = String(format: "%.4f", Double(decoded.ticker["change"]!)!)
                        self.symbolLabel.text = base
                        self.nameLabel.text = symbol
                        self.priceLabel.text = (target + price)
                        self.changeLabel.text = change + "%"
                        if Double(change)! < 0 {
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


