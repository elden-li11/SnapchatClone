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
        fetchDataJSON()
        display()
    }

    func display() {
        symbolLabel.text = data.cryptoData["BTC"]
        nameLabel.text = data.cryptoNames[1]
        priceLabel.text = data.currencyData["USD"] // + the price from api
    }
    
    var fetchedData = [String?]()
    
    func fetchDataJSON() {
        guard let url = URL(string: "https://api.cryptonator.com/api/ticker/btc-usd") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let data = data else {return}
                do {
                    let decoded = try JSONDecoder().decode(Crypto.self, from: data)
                    self.fetchedData.append(decoded.ticker["base"]!)
                    self.fetchedData.append(decoded.ticker["target"]!)
                    self.fetchedData.append(decoded.ticker["price"]!)
                    self.fetchedData.append(decoded.ticker["volume"]!)
                    self.fetchedData.append(decoded.ticker["change"]!)
                    self.fetchedData.append(String(decoded.timestamp))
                    self.fetchedData.append(String(decoded.success))
                    print(self.fetchedData)
                } catch let jsonError {
                    print("Error serializing JSON: ", jsonError)
                }
            }
        }.resume()
    }
    

}

struct Crypto: Decodable {
    let ticker: [String: String]
    let timestamp: Int
    let success: Bool
}


