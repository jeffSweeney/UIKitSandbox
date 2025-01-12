//
//  Coin.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/12/25.
//

import Foundation

struct Coin: Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice, marketCap: Double
    let marketCapRank: Int
    let totalVolume, high24H, low24H: Double
    let priceChange24H, priceChangePercentage24H: Double
    let marketCapChange24H: Double
    let marketCapChangePercentage24H: Double
    let ath: Double
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case ath
        case lastUpdated = "last_updated"
    }
}
