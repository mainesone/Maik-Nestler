//
//  HomeController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 11.02.21.
//

import UIKit

protocol HomeControllerDelegate {
    func handleSideMenuToggle(forSideMenuOption sideMenuOption: SideMenuOption?)
}

class HomeController: UIViewController {
    
    //MARK: - Properties
    var delegate: HomeControllerDelegate?
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "MaikNestler")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = UIColor(white: 1, alpha: 0.75).cgColor
        iv.layer.borderWidth = 3
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Maik Nestler"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "Husband, Dad, Tech enthusiast"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let skillLabel: UILabel = {
        let label = UILabel()
        label.text = "Skills"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    private let swiftButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Swift", for: .normal)
        return button
    }()
    
    private let xCodeButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Xcode", for: .normal)
        return button
    }()
    
    private let uiKitButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("UIKit", for: .normal)
        return button
    }()
    
    private let mvcButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("MVC", for: .normal)
        return button
    }()
    
    private let networkButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Networking", for: .normal)
        return button
    }()
    
    private let autoLayoutButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Auto Layout", for: .normal)
        return button
    }()
    
    private let mvvmButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("MVVM", for: .normal)
        return button
    }()
    
    private let gitButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Git", for: .normal)
        return button
    }()
    
    private let cocoaButton: UIButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Cocoa Pods", for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc func handleMenuToggle() {
        delegate?.handleSideMenuToggle(forSideMenuOption: nil)
    }
    
    @objc func rightNavIconTapped() {
        let swiftVC = SwiftController()
        navigationController?.pushViewController(swiftVC, animated: true)
    }
    
    //MARK: - Functions
    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.backgroundColor = .brandingColor
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backButtonTitle = ""
        
        let leftNavIcon = UIBarButtonItem(image: UIImage(systemName: "text.justify"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(handleMenuToggle))
        leftNavIcon.tintColor = .white
        navigationItem.leftBarButtonItem = leftNavIcon
        
        let rightNavIcon = UIBarButtonItem(image: UIImage(systemName: "swift"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(rightNavIconTapped))
        rightNavIcon.tintColor = .white
        navigationItem.rightBarButtonItem = rightNavIcon
    }
    
    func configureUI() {
        view.backgroundColor = .brandingColor
        view.addSubview(imageView)
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         paddingTop: 1, paddingLeft: 16)
        imageView.setDimensions(height: 150, width: 150)
        imageView.layer.cornerRadius = 150 / 2
        
        let infoStack = UIStackView(arrangedSubviews: [nameLabel,
                                                       aboutLabel])
        infoStack.axis = .vertical
        infoStack.spacing = 2
        infoStack.distribution = .fillProportionally
        
        view.addSubview(infoStack)
        infoStack.anchor(top: imageView.bottomAnchor,
                         left: view.leftAnchor,
                         paddingTop: 20, paddingLeft: 16)
        
        view.addSubview(skillLabel)
        skillLabel.anchor(top: infoStack.bottomAnchor,
                          left: view.leftAnchor,
                          paddingTop: 40, paddingLeft: 16)
        
        xCodeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        xCodeButton.setWidth(width: 100)
        
        let skillStackOne = UIStackView(arrangedSubviews: [swiftButton,
                                                           xCodeButton,
                                                           uiKitButton])
        skillStackOne.axis = .horizontal
        skillStackOne.distribution = .fillEqually
        skillStackOne.spacing = 10
        
        let skillStackTwo = UIStackView(arrangedSubviews: [mvcButton,
                                                           networkButton,
                                                           autoLayoutButton])
        skillStackTwo.axis = .horizontal
        skillStackTwo.distribution = .fillEqually
        skillStackTwo.spacing = 10
        
        let skillStackThree = UIStackView(arrangedSubviews: [mvvmButton,
                                                             gitButton,
                                                             cocoaButton])
        skillStackThree.axis = .horizontal
        skillStackThree.distribution = .fillEqually
        skillStackThree.spacing = 10
        
        let mainSkillStack = UIStackView(arrangedSubviews: [skillStackOne,
                                                            skillStackTwo,
                                                            skillStackThree])
        mainSkillStack.axis = .vertical
        mainSkillStack.distribution = .fillEqually
        mainSkillStack.spacing = 20
        view.addSubview(mainSkillStack)
        mainSkillStack.anchor(top: skillLabel.bottomAnchor,
                              left: view.leftAnchor,
                              paddingTop: 20, paddingLeft: 16)
    }
}
