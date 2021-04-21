//
//  GitHubController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 23.02.21.
//

import UIKit

private let cellIdentifier = "SwiftProjectCell"

class GitHubController: UIViewController {
    var gitImages = [#imageLiteral(resourceName: "git2"),#imageLiteral(resourceName: "git1") ]
    
    private let gitLabel: UILabel = {
        let label = UILabel()
        label.text = "GitHub Follow Up"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        layout.minimumLineSpacing = 3
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.layer.cornerRadius = 10
        cv.layer.borderColor = UIColor.white.cgColor
        cv.layer.borderWidth = 5
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
        view.addSubview(gitLabel)
        gitLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 16)
        view.addSubview(collectionView)
        collectionView.anchor(top: gitLabel.bottomAnchor, left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingBottom: 20, paddingRight: 16, width: view.bounds.width, height: 550)
    }
}

extension GitHubController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gitImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SwiftProjectCell
        let image = gitImages[indexPath.row]
        cell.imageView.image = image
        return cell
    }
}

