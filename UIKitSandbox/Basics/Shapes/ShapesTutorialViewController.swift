//
//  ShapesTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class ShapesTutorialViewController: UIViewController {
    let circleDiameter: CGFloat = 100

    private lazy var rectangle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .systemRed
        
        return view
    }()
    
    private lazy var circle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = circleDiameter/2
        view.backgroundColor = .systemBlue
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }

    private func configureLayout() {
        view.addSubview(rectangle)
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rectangle.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -8).isActive = true
        
        view.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.widthAnchor.constraint(equalToConstant: circleDiameter).isActive = true
        circle.heightAnchor.constraint(equalToConstant: circleDiameter).isActive = true
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 8).isActive = true
    }
}

#Preview {
    ShapesTutorialViewController()
}
