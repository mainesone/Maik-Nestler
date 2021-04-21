//
//  AutomotiveViewController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 16.03.21.
//

import UIKit

class AutomotiveViewController: UIViewController {
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brandingColor
        configureUI()
    }
    
    //MARK: - Helper Functions
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
    }
    
    //MARK: - Selectors
    @objc func dismisVC() {
        dismiss(animated: true, completion: nil)
    }
    
}
