//
//  ActionButtonView.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

protocol ActionButtonViewDelegate: AnyObject {
    func onPrimaryTap()
    func onSecondaryTap()
}

class ActionButtonView: UIView {
    
    weak var delegate: ActionButtonViewDelegate?
    
    private lazy var primaryActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Primary Action", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private lazy var secondaryActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Secondary Action", for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        
        addSubview(primaryActionButton)
        primaryActionButton.translatesAutoresizingMaskIntoConstraints = false
        primaryActionButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        primaryActionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        primaryActionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        primaryActionButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        primaryActionButton.addTarget(self, action: #selector(primaryActionButtonTapped), for: .touchUpInside)
        
        addSubview(secondaryActionButton)
        secondaryActionButton.translatesAutoresizingMaskIntoConstraints = false
        secondaryActionButton.topAnchor.constraint(equalTo: primaryActionButton.bottomAnchor, constant: 16).isActive = true
        secondaryActionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondaryActionButton.addTarget(self, action: #selector(secondaryActionButtonTapped), for: .touchUpInside)
    }
    
    @objc func primaryActionButtonTapped() {
        delegate?.onPrimaryTap()
    }
    
    @objc func secondaryActionButtonTapped() {
        delegate?.onSecondaryTap()
    }
}

