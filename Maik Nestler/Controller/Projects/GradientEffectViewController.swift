//
//  GradientEffectViewController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 20.04.21.
//

import UIKit

class GradientEffectViewController: UIViewController, CAAnimationDelegate {
    
    //MARK: - Properties
    let color1: CGColor = UIColor(red: 102/255, green: 178/255, blue: 112/255, alpha: 1).cgColor
    let color2: CGColor = UIColor(red: 32/255, green: 102/255, blue: 246/255, alpha: 1).cgColor
    let color3: CGColor = UIColor(red: 134/255, green: 242/255, blue: 234/255, alpha: 1).cgColor
    
    let gradient: CAGradientLayer = CAGradientLayer()
    var gradientColorSet: [[CGColor]] = []
    var colorIndex: Int = 0
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "made with UIKit"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupGradient()
        animateGradient()
        setUpUI()
    }
    
    //MARK: - Functions
    func setUpUI() {
        view.addSubview(textLabel)
        textLabel.centerY(inView: view)
        textLabel.centerXView(inView: view)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            animateGradient()
        }
    }
    
    func setupGradient(){
        gradientColorSet = [
            [color1, color2],
            [color2, color3],
            [color3, color1]
        ]
        
        gradient.frame = self.view.bounds
        gradient.colors = gradientColorSet[colorIndex]
        
        self.view.layer.addSublayer(gradient)
    }
    
    func animateGradient() {
        gradient.colors = gradientColorSet[colorIndex]
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.delegate = self
        gradientAnimation.duration = 3.0
        
        updateColorIndex()
        gradientAnimation.toValue = gradientColorSet[colorIndex]
        
        gradientAnimation.fillMode = .forwards
        gradientAnimation.isRemovedOnCompletion = false
        
        gradient.add(gradientAnimation, forKey: "colors")
    }
    
    func updateColorIndex(){
        if colorIndex < gradientColorSet.count - 1 {
            colorIndex += 1
        } else {
            colorIndex = 0
        }
    }
}
