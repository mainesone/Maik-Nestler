//
//  CardLabel.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 05.05.21.
//

import UIKit

class CardLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
        
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
            
        textColor = .white
        adjustsFontSizeToFitWidth = true
        layer.cornerRadius = 10
        clipsToBounds = true 
    }
}
