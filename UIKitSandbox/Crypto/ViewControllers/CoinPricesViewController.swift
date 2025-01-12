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
    }

}

extension CoinPricesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    
}

extension CoinPricesViewController: UITableViewDelegate {
    
}