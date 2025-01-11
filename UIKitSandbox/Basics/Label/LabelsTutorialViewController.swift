//
//  LabelsTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class LabelsTutorialViewController: UIViewController {

    private var textLabel =  UILabel()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Super awesome programmatic UI!"
        label.textColor = .gray
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = "Hello World!"
        textLabel.font = .boldSystemFont(ofSize: 20)
        
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

#Preview {
    return LabelsTutorialViewController()
}
