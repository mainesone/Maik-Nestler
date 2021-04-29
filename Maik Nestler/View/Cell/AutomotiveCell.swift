//
//  AutomotiveCell.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 28.04.21.
//

import UIKit

class AutomotiveCell: UITableViewCell {
    
    //MARK: - Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Titel"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.alpha = 0.9
        label.textColor = .white
        return label
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorite"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.alpha = 0.8
        label.textColor = .white
        return label
    }()
            
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "Company"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.alpha = 0.7
        label.textColor = .white
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .brandingColor
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 16)
        addSubview(mainLabel)
        mainLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, paddingTop: 5, paddingLeft: 16)
        addSubview(subLabel)
        subLabel.anchor(top: mainLabel.bottomAnchor, left: leftAnchor, paddingTop: 5, paddingLeft: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
