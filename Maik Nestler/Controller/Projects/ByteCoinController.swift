//
//  ByteCoinController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 24.02.21.
//

import UIKit

private let cellIdentifier = "SwiftProjectCell"

class ByteCoinController: UIViewController {
    
    //MARK: - Properties
    var byteImages = [#imageLiteral(resourceName: "BytecoinPic1"), #imageLiteral(resourceName: "BytecoinPic2"), #imageLiteral(resourceName: "BytecoinPic3")]
    
    private let byteLabel: UILabel = {
        let label = UILabel()
        label.text = "ByteCoin"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 450)
        layout.minimumLineSpacing = 1
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.layer.cornerRadius = 10
        cv.layer.borderColor = UIColor.white.cgColor
        cv.dataSource = self
        cv.register(SwiftProjectCell.self, forCellWithReuseIdentifier: cellIdentifier)
        cv.backgroundColor = .brandingColor
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .brandingColor
        view.addSubview(byteLabel)
        byteLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 16)
        view.addSubview(collectionView)
        collectionView.anchor(top: byteLabel.bottomAnchor, left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 40, width: view.frame.width, height: 500)
        
    }
}

extension ByteCoinController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return byteImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SwiftProjectCell
        let image = byteImages[indexPath.row]
        cell.imageView.image = image
        return cell
    }
}

