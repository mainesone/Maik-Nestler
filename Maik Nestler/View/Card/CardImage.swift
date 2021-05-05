//
//  CardImage.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 05.05.21.
//

import UIKit

class CardImage: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() {
        image = UIImage()
        clipsToBounds = true
        layer.cornerRadius = 10
        contentMode = .scaleAspectFill
    }

}
