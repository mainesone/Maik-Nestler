//
//  CustomButton.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 24.02.21.
//

import UIKit

class CustomButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        tintColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        let gradientLayer = CAGradientLayer()
        let leftColor = UIColor.white
        let rightColor = UIColor.black
        
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.9, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        let cornerRadius = rect.height / 2
        
        let maskLayer = CAShapeLayer()
        
        let maskPath = CGMutablePath()
        
        maskPath.addPath(UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath)
        
        maskPath.addPath(UIBezierPath(roundedRect: rect.insetBy(dx: 2, dy: 2), cornerRadius: cornerRadius).cgPath)
        
        maskLayer.path = maskPath
        maskLayer.fillRule = .evenOdd
        
        gradientLayer.mask = maskLayer
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        
        gradientLayer.frame = rect
    }
}

