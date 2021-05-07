//
//  CardView.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 05.05.21.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = .brandingColor
        layer.cornerRadius = 15
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize( width: 2, height: 2)
        layer.shadowColor = UIColor.black.cgColor
        layer.masksToBounds = false
    }
}
