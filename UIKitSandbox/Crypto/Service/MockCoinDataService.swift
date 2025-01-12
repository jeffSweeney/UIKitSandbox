//
//  MockCoinDataService.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/12/25.
//

import Foundation

struct MockCoinDataService {
    func fetchCoins() async throws -> [Coin] {
        do {
            return try JSONDecoder().decode([Coin].self, from: MockData.mockCoinsJSON)
        } catch {
            throw error
        }
    }
}
