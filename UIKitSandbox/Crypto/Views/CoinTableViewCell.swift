//
//  CoinTableViewCell.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/12/25.
//

import UIKit
import Kingfisher

class CoinTableViewCell: UITableViewCell {
    
    private let coinRankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray3
        
        return label
    }()
    
    private let coinImageView = UIImageView()
    
    private let coinNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private let coinSymbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private let coinPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private let coinPercentChangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(coin: Coin) {
        let url = URL(string: coin.image)
        coinImageView.kf.setImage(with: url)
        
        coinRankLabel.text = "\(coin.marketCapRank)"
        coinNameLabel.text = coin.name
        coinSymbolLabel.text = coin.symbol
        coinPriceLabel.text = "\(coin.currentPrice)"
        coinPercentChangeLabel.text = "\(coin.priceChangePercentage24H)"
    }
 
    func configureLayout() {
        contentView.addSubview(coinRankLabel)
        coinRankLabel.translatesAutoresizingMaskIntoConstraints = false
        coinRankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        coinRankLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        coinRankLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(coinImageView)
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        coinImageView.leadingAnchor.constraint(equalTo: coinRankLabel.trailingAnchor, constant: 16).isActive = true
        coinImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        let coinNameStack = UIStackView(arrangedSubviews: [coinNameLabel, coinSymbolLabel])
        coinNameStack.axis = .vertical
        coinNameStack.spacing = 4
        coinNameStack.alignment = .leading
        
        contentView.addSubview(coinNameStack)
        coinNameStack.translatesAutoresizingMaskIntoConstraints = false
        coinNameStack.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 16).isActive = true
        coinNameStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        let priceStack = UIStackView(arrangedSubviews: [coinPriceLabel, coinPercentChangeLabel])
        priceStack.axis = .vertical
        priceStack.spacing = 4
        priceStack.alignment = .trailing
        
        contentView.addSubview(priceStack)
        priceStack.translatesAutoresizingMaskIntoConstraints = false
        priceStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        priceStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

// MARK: - MOCK DATA HELPER
extension CoinTableViewCell {
    func setupMockData() {
        coinRankLabel.text = "1"
        coinImageView.image = UIImage(systemName: "dollarsign.circle")
        coinNameLabel.text = "Dollarcoin"
        coinSymbolLabel.text = "DOLC"
        coinPriceLabel.text = "$123.45"
        coinPercentChangeLabel.text = "+1.23%"
    }
}

#Preview {
    CoinTableViewCell()
}
