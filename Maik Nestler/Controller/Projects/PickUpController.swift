//
//  PickUpController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 23.02.21.
//

import UIKit

private let cellIdentifier = "SwiftProjectCell"

class PickUpController: UIViewController {
    
    //MARK: - Properties
    var pickUpImages = [#imageLiteral(resourceName: "PickPic1"), #imageLiteral(resourceName: "PickPic2"), #imageLiteral(resourceName: "PickPic3"), #imageLiteral(resourceName: "PickPic4.jpg"), #imageLiteral(resourceName: "PickPic5.jpg"), #imageLiteral(resourceName: "PickPic6.jpg")]
    
    private let pickUpLabel: UILabel = {
        let label = UILabel()
        label.text = "PickUp"
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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Functions
    func configureUI() {
        view.backgroundColor = .brandingColor
        view.addSubview(pickUpLabel)
        pickUpLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 16)
        view.addSubview(collectionView)
        collectionView.anchor(top: pickUpLabel.bottomAnchor, left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 40, width: view.frame.width, height: 500)
    }
}

//MARK: - CollectionView DataSource
extension PickUpController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pickUpImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SwiftProjectCell
        let image = pickUpImages[indexPath.row]
        cell.imageView.image = image
        return cell
    }
}
