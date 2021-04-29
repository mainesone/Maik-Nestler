//
//  AutomotiveViewController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 16.03.21.
//

import UIKit

private let reuseIdentifier = "AutomotiveCell"

class AutomotiveViewController: UIViewController {
    
    //MARK: - Properties
    let tableView = UITableView()
    let indexPath = ["Allora", "MSX", "JAPAN"]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brandingColor
        configureUI()
    }
    
    //MARK: - Functions
    func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Automotive Career"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.backgroundColor = .brandingColor
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        let leftNavIcon = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                          style: .plain, target: self,
                                          action: #selector(dismisVC))
        leftNavIcon.tintColor = .white
        navigationItem.leftBarButtonItem = leftNavIcon
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AutomotiveCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        tableView.allowsSelection = false
        tableView.backgroundColor = .brandingColor
        tableView.frame = view.frame
        tableView.isScrollEnabled = false
    }
    
    //MARK: - Selectors
    @objc func dismisVC() {
        dismiss(animated: true, completion: nil)
    }
}

extension AutomotiveViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let section = AutomotiveSections(rawValue: section) else { return nil }
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
//        headerView.backgroundColor = .brandingColor
//        
//        let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: headerView.frame.width - 10, height: headerView.frame.height - 10))
//        headerLabel.text = section.description
//        headerLabel.textColor = .white
//        headerLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        headerLabel.alpha = 0.75
//        headerView.addSubview(headerLabel)
//        return headerView
//    }
}

extension AutomotiveViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JobSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AutomotiveCell
        let jobSection = JobSections(rawValue: indexPath.row)
        let companySection = CompanySection(rawValue: indexPath.row)
        let dateSection = DateSection(rawValue: indexPath.row)
        cell.titleLabel.text = jobSection?.description
        cell.mainLabel.text = companySection?.description
        cell.subLabel.text = dateSection?.description
        return cell
    }
}
