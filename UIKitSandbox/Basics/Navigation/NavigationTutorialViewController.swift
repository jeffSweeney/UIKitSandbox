//
//  NavigationTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class NavigationTutorialViewController: UIViewController {
    
    private lazy var primaryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Navigate", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }
    
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(primaryButton)
        primaryButton.translatesAutoresizingMaskIntoConstraints = false
        primaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        primaryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        primaryButton.addTarget(self, action: #selector(navigate), for: .touchUpInside)
    }
    
    @objc func navigate() {
        let newVC = CollectionTutorialViewController()
//        show(newVC, sender: self)
        navigationController?.pushViewController(newVC, animated: true)
    }
}
