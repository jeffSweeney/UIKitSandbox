//
//  StacksTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class StacksTutorialViewController: UIViewController {

    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }
    
    private func configureLayout() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let colors: [UIColor] = [.green, .blue, .red]
        for color in colors {
            stackView.addArrangedSubview(createRectangle(color: color))
        }
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func createRectangle(color: UIColor) -> UIView {
        let rectangle = UIView()
        rectangle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rectangle.backgroundColor = color
        rectangle.layer.cornerRadius = 8
        
        return rectangle
    }
}

#Preview {
    StacksTutorialViewController()
}
