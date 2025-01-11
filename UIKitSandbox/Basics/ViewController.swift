//
//  ViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/8/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var primaryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingLabel.textAlignment = .center
        greetUser(name: "World")
    }
    
    func greetUser(name: String) {
        greetingLabel.text = "Hello, \(name)!"
    }
    
    @IBAction func primaryButtonTapped(_ sender: Any) {
        greetUser(name: "Jeff")
    }
}

