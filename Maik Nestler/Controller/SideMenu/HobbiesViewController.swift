//
//  HobbiesViewController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 29.04.21.
//

import UIKit


class HobbiesViewController: UIViewController, UIScrollViewDelegate {
    
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
    
    lazy var topCard: UIView = {
        let view = CardView()
        return view
    }()
    
    private let topCardImage: UIImageView = {
        let iv = CardImage(frame: .zero)
        iv.image = #imageLiteral(resourceName: "americanfootball")
        return iv
    }()
    
    private let topCardLabel: UILabel = {
        let label = CardLabel(fontSize: 24)
        label.text = "American Football"
        return label
    }()
    
    lazy var topMiddleCard: UIView = {
        let view = CardView()
        return view
    }()
    
    private let topMiddleCardImage: UIImageView = {
        let iv = CardImage(frame: .zero)
        iv.image = #imageLiteral(resourceName: "bali.jpg")
        return iv
    }()
    
    private let topMiddleCardLabel: UILabel = {
        let label = CardLabel(fontSize: 24)
        label.text = "Travel"
        return label
    }()
    
    lazy var lowMiddleCard: UIView = {
        let view = CardView()
        return view
    }()
    
    private let lowMiddleCardImage: UIImageView = {
        let iv = CardImage(frame: .zero)
        iv.image = #imageLiteral(resourceName: "tennis")
        return iv
    }()
    
    private let lowMiddleCardLabel: UILabel = {
        let label = CardLabel(fontSize: 24)
        label.text = "Tennis"
        return label
    }()
    
    lazy var lowCard: UIView = {
        let view = CardView()
        return view
    }()
    
    private let lowCardImage: UIImageView = {
        let iv = CardImage(frame: .zero)
        iv.image = #imageLiteral(resourceName: "bike")
        return iv
    }()
    
    private let lowCardLabel: UILabel = {
        let label = CardLabel(fontSize: 24)
        label.text = "Bicycle"
        return label
    }()
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureScrollView()
        configureCardView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.height + 500)
    }
    
    //MARK: - Selectors
    @objc func dismisVC() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Functions
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Hobbies"
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
                          bottom: view.bottomAnchor,
                          right: view.rightAnchor)
    }
    
    func configureCardView() {
        scrollView.addSubview(topCard)
        topCard.anchor(top: scrollView.topAnchor,
                       left: scrollView.leftAnchor,
                       right: scrollView.rightAnchor,
                       paddingTop: 20, paddingLeft: 20, paddingRight: 10,
                       width: view.frame.width - 40, height: 300)
        
        scrollView.addSubview(topMiddleCard)
        topMiddleCard.anchor(top: topCard.bottomAnchor,
                             left: scrollView.leftAnchor,
                             right: scrollView.rightAnchor,
                             paddingTop: 20, paddingLeft: 20, paddingRight: 10,
                             width: view.frame.width - 40, height: 300)
        
        scrollView.addSubview(lowMiddleCard)
        lowMiddleCard.anchor(top: topMiddleCard.bottomAnchor,
                             left: scrollView.leftAnchor,
                             right: scrollView.rightAnchor,
                             paddingTop: 20, paddingLeft: 20, paddingRight: 10,
                             width: view.frame.width - 40, height: 300)
        
        scrollView.addSubview(lowCard)
        lowCard.anchor(top: lowMiddleCard.bottomAnchor,
                       left: scrollView.leftAnchor,
                       right: scrollView.rightAnchor,
                       paddingTop: 20, paddingLeft: 20, paddingRight: 10,
                       width: view.frame.width - 40, height: 300)
        
        topCard.addSubview(topCardImage)
        topCardImage.anchor(top: topCard.topAnchor,
                            left: topCard.leftAnchor,
                            bottom: topCard.bottomAnchor,
                            right: topCard.rightAnchor)
        
        topCard.addSubview(topCardLabel)
        topCardLabel.anchor(bottom: topCard.bottomAnchor,
                            right: topCard.rightAnchor,
                            paddingBottom: 10, paddingRight: 16)
        
        topMiddleCard.addSubview(topMiddleCardImage)
        topMiddleCardImage.anchor(top: topMiddleCard.topAnchor,
                                  left: topMiddleCard.leftAnchor,
                                  bottom: topMiddleCard.bottomAnchor,
                                  right: topMiddleCard.rightAnchor)
        
        topMiddleCard.addSubview(topMiddleCardLabel)
        topMiddleCardLabel.anchor(bottom: topMiddleCard.bottomAnchor,
                                  right: topMiddleCard.rightAnchor,
                                  paddingBottom: 10, paddingRight: 16)
        
        lowMiddleCard.addSubview(lowMiddleCardImage)
        lowMiddleCardImage.anchor(top: lowMiddleCard.topAnchor,
                                  left: lowMiddleCard.leftAnchor,
                                  bottom: lowMiddleCard.bottomAnchor,
                                  right: lowMiddleCard.rightAnchor)
        
        lowMiddleCard.addSubview(lowMiddleCardLabel)
        lowMiddleCardLabel.anchor(bottom: lowMiddleCard.bottomAnchor,
                                  right: lowMiddleCard.rightAnchor,
                                  paddingBottom: 10, paddingRight: 16)
        
        lowCard.addSubview(lowCardImage)
        lowCardImage.anchor(top: lowCard.topAnchor,
                            left: lowCard.leftAnchor,
                            bottom: lowCard.bottomAnchor,
                            right: lowCard.rightAnchor)
        
        lowCard.addSubview(lowCardLabel)
        lowCardLabel.anchor(bottom: lowCard.bottomAnchor,
                            right: lowCard.rightAnchor,
                            paddingBottom: 10, paddingRight: 16)
    }
}
