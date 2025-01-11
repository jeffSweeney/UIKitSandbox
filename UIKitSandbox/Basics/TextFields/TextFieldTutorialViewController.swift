//
//  TextFieldTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class TextFieldTutorialViewController: UIViewController {

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search..."
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .search
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLayout()
    }

    private func configureLayout() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        textField.delegate = self
        textField.addTarget(self, action: #selector(onEditingChange), for: .editingChanged)
    }
    
    // Awesome for things like search results as changes happen.
    @objc func onEditingChange(_ sender: UITextField) {
        print("DEBUG: Text field text is \(sender.text ?? "empty")")
    }
}

extension TextFieldTutorialViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("DEBUG: RETURN KEY TAPPED")
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DEBUG: DID BEGIN EDITING")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("DEBUG: DID END EDITING")
    }
}

#Preview {
    return TextFieldTutorialViewController()
}
