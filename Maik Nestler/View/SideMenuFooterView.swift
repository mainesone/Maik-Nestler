//
//  SideMenuFooterView.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 09.03.21.
//

import UIKit

class SideMenuFooterView: UIView {
        
    //MARK: - Properties
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorite Quote"
        label.textColor = .brandingColor
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let quoteTextLabel: UILabel = {
        let label = UILabel()
        label.text = """
                    „Because we all know that in
                    software development only
                    one thing remains constant,
                    and that thing is change“
                    """
        label.textColor = .brandingColor
        label.textAlignment = .left
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "appstore")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = UIColor(white: 1, alpha: 0.75).cgColor
        iv.layer.borderWidth = 3
        iv.setDimensions(height: 60, width: 60)
        return iv
    }()
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white

        let quoteStack = UIStackView(arrangedSubviews: [quoteLabel, quoteTextLabel])
        quoteStack.axis = .vertical
        quoteStack.spacing = 2
        quoteStack.distribution = .fillProportionally
        addSubview(quoteStack)
        quoteStack.anchor(top: topAnchor, left: leftAnchor,
                          paddingTop: 30, paddingLeft: 16)
        
        addSubview(logoImageView)
        logoImageView.anchor(top: quoteStack.bottomAnchor, left: leftAnchor,
                             paddingTop: 30, paddingLeft: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
