//
//  ButtonTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class ButtonTutorialViewController: UIViewController {

    private lazy var showNameButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Show Name", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Hi, I'm Jeff!"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showNameButton.addTarget(self, action: #selector(onShowNameTapped), for: .touchUpInside)
        
        view.addSubview(showNameButton)
        showNameButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        showNameButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        showNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showNameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: showNameButton.bottomAnchor, constant: 20).isActive = true
    }
    
    @objc private func onShowNameTapped() {
        nameLabel.isHidden.toggle()
        
        let newButtonLabel = nameLabel.isHidden ? "Show Name" : "Hide Name"
        showNameButton.setTitle(newButtonLabel, for: .normal)
    }
}

#Preview {
    ButtonTutorialViewController()
}
