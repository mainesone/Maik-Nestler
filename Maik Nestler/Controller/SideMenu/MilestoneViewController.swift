//
//  MilestoneViewController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 06.05.21.
//

import UIKit

class MilestoneViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Properties
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .clear
        view.autoresizingMask = .flexibleHeight
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bounces = true
        view.delegate = self
        return view
    }()
    
    lazy var familyCard: UIView = {
        let view = CardView()
        view.backgroundColor = .white
        return view
    }()
    
    private let familyCardImage: UIImageView = {
        let iv = CardImage(frame: .zero)
        iv.image = #imageLiteral(resourceName: "family.jpg")
        return iv
    }()
    
    private let familyCardLabel: UILabel = {
        let label = CardLabel(fontSize: 20)
        label.text = CardText.family.rawValue
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 5
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var workshopCard: UIView = {
        let view = CardView()
        view.backgroundColor = .white
        return view
    }()
    
    private let workshopCardImage: UIImageView = {
        let iv = CardImage(frame: .zero)
        iv.image = #imageLiteral(resourceName: "carworkshop")
        return iv
    }()
    
    private let workshopCardLabel: UILabel = {
        let label = CardLabel(fontSize: 20)
        label.text = CardText.workshop.rawValue
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 9
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var masterCard: UIView = {
        let view = CardView()
        view.backgroundColor = .white
        return view
    }()
    
    private let masterCardImage: UIImageView = {
        let iv = CardImage(frame: .zero)
        iv.image = #imageLiteral(resourceName: "office")
        return iv
    }()
    
    private let masterCardLabel: UILabel = {
        let label = CardLabel(fontSize: 20)
        label.text = CardText.master.rawValue
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 8
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var stepCard: UIView = {
        let view = CardView()
        view.backgroundColor = .white
        return view
    }()
    
    private let stepCardImage: UIImageView = {
        let iv = CardImage(frame: .zero)
        iv.image = #imageLiteral(resourceName: "step")
        return iv
    }()
    
    private let stepCardLabel: UILabel = {
        let label = CardLabel(fontSize: 20)
        label.text = CardText.step.rawValue
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 9
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureScrollView()
        configureCards()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width + 1200,
                                        height: UIScreen.main.bounds.height - 500)
    }
    
    //MARK: - Selectors
    @objc func dismisVC() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Functions
    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Milestones"
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
    
    func configureScrollView() {
        view.backgroundColor = .brandingColor
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.rightAnchor)
    }
    
    func configureCards() {
        scrollView.addSubview(familyCard)
        familyCard.anchor(top: scrollView.topAnchor,
                       left: scrollView.leftAnchor,
                       right: scrollView.rightAnchor,
                       paddingTop: 20, paddingLeft: 20, paddingRight: 20,
                       width: view.frame.width - 40, height: 600)
        
        scrollView.addSubview(workshopCard)
        workshopCard.anchor(top: scrollView.topAnchor,
                       left: familyCard.rightAnchor,
                       paddingTop: 20, paddingLeft: 20,
                       width: view.frame.width - 40, height: 600)
        
        scrollView.addSubview(masterCard)
        masterCard.anchor(top: scrollView.topAnchor,
                       left: workshopCard.rightAnchor,
                       paddingTop: 20, paddingLeft: 20,
                       width: view.frame.width - 40, height: 600)
        
        scrollView.addSubview(stepCard)
        stepCard.anchor(top: scrollView.topAnchor,
                       left: masterCard.rightAnchor,
                       paddingTop: 20, paddingLeft: 20,
                       width: view.frame.width - 40, height: 600)
        
        let familyStack = UIStackView(arrangedSubviews: [familyCardImage,
                                                         familyCardLabel])
        familyStack.axis = .vertical
        familyStack.distribution = .fillEqually
        familyStack.layer.cornerRadius = 15
        
        familyCard.addSubview(familyStack)
        familyStack.anchor(top: familyCard.topAnchor,
                           left: familyCard.leftAnchor,
                           bottom: familyCard.bottomAnchor,
                           right: familyCard.rightAnchor)
        
        let workshopStack = UIStackView(arrangedSubviews: [workshopCardImage,
                                                           workshopCardLabel])
        workshopStack.axis = .vertical
        workshopStack.distribution = .fillEqually
        workshopStack.layer.cornerRadius = 15
        
        workshopCard.addSubview(workshopStack)
        workshopStack.anchor(top: workshopCard.topAnchor,
                             left: workshopCard.leftAnchor,
                             bottom: workshopCard.bottomAnchor,
                             right: workshopCard.rightAnchor)
        
        let masterStack = UIStackView(arrangedSubviews: [masterCardImage,
                                                         masterCardLabel])
        masterStack.axis = .vertical
        masterStack.distribution = .fillEqually
        masterStack.layer.cornerRadius = 15
        
        masterCard.addSubview(masterStack)
        masterStack.anchor(top: masterCard.topAnchor,
                           left: masterCard.leftAnchor,
                           bottom: masterCard.bottomAnchor,
                           right: masterCard.rightAnchor)
        
        let stepStack = UIStackView(arrangedSubviews: [stepCardImage,
                                                       stepCardLabel])
        stepStack.axis = .vertical
        stepStack.distribution = .fillEqually
        stepStack.layer.cornerRadius = 15
        
        stepCard.addSubview(stepStack)
        stepStack.anchor(top: stepCard.topAnchor,
                         left: stepCard.leftAnchor,
                         bottom: stepCard.bottomAnchor,
                         right: stepCard.rightAnchor)
    }
}
