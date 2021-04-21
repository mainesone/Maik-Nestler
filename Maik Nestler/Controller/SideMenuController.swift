//
//  SideMenuController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 08.03.21.
//

import UIKit

private let reuseIdentifer = "SideMenuCell"

class SideMenuController: UIViewController {
    
    // MARK: - Properties
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Handlers
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.separatorColor = .white
        tableView.rowHeight = 80
        tableView.tableFooterView = SideMenuFooterView()
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

extension SideMenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! SideMenuCell
        
        let menuOption = SideMenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sideMenuOption = SideMenuOption(rawValue: indexPath.row)
        delegate?.handleSideMenuToggle(forSideMenuOption: sideMenuOption)
    }
}
