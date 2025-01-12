//
//  CoinPricesViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/12/25.
//

import UIKit

private let reuseIdentifier = "Cell"

class CoinPricesViewController: UIViewController {
    
    private let tableView = UITableView()
    private let service = MockCoinDataService()
    
    private var coins: [Coin] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "All Coins"
        view.backgroundColor = .systemBackground
        
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.frame
        tableView.rowHeight = 56
        
        Task { await fetchCoins() }
    }
    
    func fetchCoins() async {
        do {
            coins = try await service.fetchCoins()
            tableView.reloadData()
            print("DEBIG: Coins count \(coins.count)")
        } catch {
            print("DEBUG: Failed to fetch coins: \(error.localizedDescription)")
        }
    }
}

extension CoinPricesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CoinTableViewCell
        cell.configure(coin: coins[indexPath.row])
        
        return cell
    }
    
    
}

extension CoinPricesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = coins[indexPath.row]
        let detailsVC = CoinDetailsViewController(coin: coin)
        
        show(detailsVC, sender: self)
    }
}
