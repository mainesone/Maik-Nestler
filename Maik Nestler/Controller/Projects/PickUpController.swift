//
//  PickUpController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 23.02.21.
//

import UIKit

class PickUpController: UIViewController {
    
    private let PickUPImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Preview Presentation")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        view.backgroundColor = .brandingColor
        view.addSubview(PickUPImage)
        PickUPImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
