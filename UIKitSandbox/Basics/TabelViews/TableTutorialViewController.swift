//
//  TableTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class TableTutorialViewController: UITableViewController {
    
    private lazy var footerView: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update Table", for: .normal)
        button.addTarget(self, action: #selector(updateTable), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()

    private var constructors = [
        "Mercades",
        "Ferrari",
        "Aston Martin",
        "Red Bull"
    ]
    
    private var drivers = [
        "Lewis Hamilton",
        "George Russel",
        "Charles Leclerc",
        "Carlos Sainz",
        "Fernando Alonso",
        "Lance Stroll",
        "Max Verstappen",
        "Checo Perez"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return constructors.count
        case 1:
            return drivers.count
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        var content = cell.defaultContentConfiguration()
        
        switch indexPath.section {
        case 0:
            content.text = constructors[indexPath.row]
        case 1:
            content.text = drivers[indexPath.row]
        default:
            break
        }

        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Constructors"
        case 1:
            return "Drivers"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == 1 else { return nil }
        
        footerView.backgroundColor = .systemBlue
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard section == 1 else { return 0 }
        
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("DEBUG: Did select index \(indexPath)")
    }
    
    @objc func updateTable() {
        guard drivers.count > 0 else { return }
        
        drivers.removeLast()
        tableView.reloadData()
    }
}
