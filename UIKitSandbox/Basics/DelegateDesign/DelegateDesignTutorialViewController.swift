//
//  DelegateDesignTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class DelegateDesignTutorialViewController: UIViewController {
    private var actionButtonView = ActionButtonView()
    
    private var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }

    private func configureLayout() {
        view.addSubview(actionButtonView)
        view.backgroundColor = .systemGroupedBackground
        
        actionButtonView.delegate = self
        actionButtonView.translatesAutoresizingMaskIntoConstraints = false
        actionButtonView.layer.shadowColor = UIColor.black.cgColor
        actionButtonView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        actionButtonView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        actionButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: actionButtonView.bottomAnchor, constant: 16).isActive = true
        textLabel.text = "Primay Action Button Tapped"
        textLabel.isHidden = true
    }
}

extension DelegateDesignTutorialViewController: ActionButtonViewDelegate {
    func onPrimaryTap() {
        textLabel.isHidden = false
    }
    
    func onSecondaryTap() {
        textLabel.isHidden = true
    }
}

#Preview {
    DelegateDesignTutorialViewController()
}
