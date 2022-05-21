//
//  CryptoModel.swift
//  CryptoApp
//
//  Created by Tristan Aly on 21/05/2022.
//

import Foundation

struct CryptoModel {
    let name: String
    let symbol: String
    let iconName: String
    let value: Float
    let evolution: Float
    
}
let cryptoCurrency = [
    CryptoModel(name: "Bitcoin", symbol: "BTC", iconName: "btc", value: 27716.42, evolution: +0.54),
    CryptoModel(name: "Etherium", symbol: "ETH", iconName: "eth", value: 1861.12, evolution: -1.04),
    CryptoModel(name: "Dogecoin", symbol: "DOGE", iconName: "doge", value: 1665.54, evolution: +0.94),
    CryptoModel(name: "Kanura", symbol: "KAR", iconName: "kanura", value: 2665.64, evolution: -2.84),
    CryptoModel(name: "Tether", symbol: "USDT", iconName: "tether", value: 665.54, evolution: +2.54),
    CryptoModel(name: "USD Coin", symbol: "USDC", iconName: "usdCoin", value: 665.64, evolution: +3.54),
]
