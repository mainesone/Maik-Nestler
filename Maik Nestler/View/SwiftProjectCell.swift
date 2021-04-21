//
//  GitHubCell.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 24.02.21.
//

import UIKit

class SwiftProjectCell: UICollectionViewCell {
    
    //MARK: - Properties
    let imageView = UIImageView()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.alpha = 1
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, width: bounds.width, height: bounds.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
