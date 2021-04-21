//
//  SwiftController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 23.02.21.
//

import UIKit

private let reuseIdentifier = "SwiftCell"

class SwiftController: UIViewController {
    
    //MARK: - Properties
    let tableView = UITableView()
    var projects = ["ByteCoin", "PickUp", "fyxes", "GitHub Follow Up", "GradientEffect"]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    //MARK: - HelperFunctions
    func configureUI () {
        view.backgroundColor = .brandingColor
        view.addSubview(tableView)
        tableView.backgroundColor = .brandingColor
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.frame = view.frame
        tableView.tableFooterView = UIView()
        tableView.isScrollEnabled = false 
        
    }
}

//MARK: - TableView Delegate & DataSource
extension SwiftController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        headerView.backgroundColor = .brandingColor
        
        let headerLabel = UILabel(frame: CGRect(x: 20, y: 5, width: headerView.frame.width - 10, height: headerView.frame.height - 10))
        headerLabel.text = "iOS Projects"
        headerLabel.textColor = .white
        headerLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .brandingColor
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        cell.textLabel?.text = projects[indexPath.row]
        cell.accessoryType = .detailButton
        cell.tintColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        if indexPath.row == 0 {
            let byteCoinVC = ByteCoinController()
            byteCoinVC.modalPresentationStyle = .formSheet
            navigationController?.present(byteCoinVC, animated: true, completion: nil)
        }
        
        else if indexPath.row == 1 {
            let gitVC = GitHubController()
            gitVC.modalPresentationStyle = .formSheet
            navigationController?.present(gitVC, animated: true, completion: nil)
        }
        
        else if indexPath.row == 2 {
            let pickUpVC = PickUpController()
            pickUpVC.modalPresentationStyle = .formSheet
            navigationController?.present(pickUpVC, animated: true, completion: nil)
        }
        
        else if indexPath.row == 4 {
            let gradientVC = GradientEffectViewController()
            gradientVC.modalPresentationStyle = .formSheet
            navigationController?.present(gradientVC, animated: true, completion: nil)
        }
    }
}
