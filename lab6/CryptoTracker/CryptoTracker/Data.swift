//
//  Data.swift
//  CryptoTracker
//
//  Created by David [Entei] Xiong on 3/7/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class Data {
    
    let cryptoData = ["BTC": "Bitcoin",
                      "LTC": "Litecoin",
                      "ETH": "Etherium",
                      "BCH": "Bitcoin Cash",
                      "XRP": "Ripple",
                      "ZEC": "ZCash",
                      "XMR": "Monero",
                      "MKR": "Maker"]
    
    let cryptoDataReversed = ["Bitcoin": "BTC",
                              "Litecoin": "LTC",
                              "Etherium": "ETH",
                              "Bitcoin Cash": "BCH",
                              "Ripple": "XRP",
                              "ZCash": "ZEC",
                              "Monero": "XMR",
                              "Maker": "MKR"]
    var cryptoNames:[String]!
    let currencyData = ["USD": "$",
                        "EUR": "€",
                        "GBP": "£"]
    var currencyNames:[String]!
    var fullNames:[String]!
    
    init() {
        cryptoNames = Array(cryptoData.keys).sorted()
        fullNames = Array(cryptoData.values).sorted()
        currencyNames = Array(currencyData.keys).sorted()
    }

    
}
