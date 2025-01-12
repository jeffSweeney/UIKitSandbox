//
//  CoinDetailsViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/12/25.
//

import UIKit
import Kingfisher

class CoinDetailsViewController: UIViewController {
    private let coin: Coin
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        let url = URL(string: coin.image)
        imageView.kf.setImage(with: url)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = coin.name
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.text = coin.symbol
        label.font = .systemFont(ofSize: 24)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var coinPriceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Coin Price"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var coinPriceLabel: UILabel = {
        let label = UILabel()
        label.text = coin.currentPrice.asCryptoPrice
        label.font = .systemFont(ofSize: 24)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var dayChangeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "24 Hour Change"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var dayChangeTotalLabel: UILabel = {
        let label = UILabel()
        label.text = coin.priceChange24H.asCryptoPrice
        label.font = .systemFont(ofSize: 24)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var dayChangePercentageLabel: UILabel = {
        let label = UILabel()
        label.text = coin.priceChangePercentage24H.asCryptoPercentage
        label.font = .systemFont(ofSize: 24)
        label.textColor = coin.priceChangePercentage24H < 0 ? .systemRed : .systemGreen
        
        return label
    }()
    
    init(coin: Coin) {
        self.coin = coin
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureLayout()
    }
    
    private func configureLayout() {
        let coinStackView = UIStackView(arrangedSubviews: [logoImageView, nameLabel, symbolLabel])
        view.addSubview(coinStackView)
        coinStackView.translatesAutoresizingMaskIntoConstraints = false
        coinStackView.axis = .vertical
        coinStackView.spacing = 8
        coinStackView.alignment = .center
        coinStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        coinStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48).isActive = true
        
        let priceStackView = UIStackView(arrangedSubviews: [coinPriceTitleLabel, coinPriceLabel])
        view.addSubview(priceStackView)
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.axis = .vertical
        priceStackView.spacing = 12
        priceStackView.alignment = .center
        priceStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceStackView.topAnchor.constraint(equalTo: coinStackView.bottomAnchor, constant: 48).isActive = true
        
        let changeStackView = UIStackView(arrangedSubviews: [dayChangeTitleLabel, dayChangeTotalLabel, dayChangePercentageLabel])
        view.addSubview(changeStackView)
        changeStackView.translatesAutoresizingMaskIntoConstraints = false
        changeStackView.axis = .vertical
        changeStackView.spacing = 12
        changeStackView.alignment = .center
        changeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeStackView.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 48).isActive = true
    }
}

#Preview {
    CoinDetailsViewController(coin: MockData.bitcoin)
}
