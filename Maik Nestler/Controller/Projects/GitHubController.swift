//
//  GitHubController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 23.02.21.
//

import UIKit

private let cellIdentifier = "SwiftProjectCell"

class GitHubController: UIViewController {
    
    //MARK: - Properties
    var gitImages = [#imageLiteral(resourceName: "GitPic1.jpg"),#imageLiteral(resourceName: "GitPic2.jpg"), #imageLiteral(resourceName: "GitPic3.jpg"), #imageLiteral(resourceName: "GitPic4.jpg")]
    
    private let gitLabel: UILabel = {
        let label = UILabel()
        label.text = "GitHub FollowUp"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = """
                    Fully programmatic approach without
                    the use of storyboards. No 3rd party
                    libaries. Using API and networking.
                    """
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 20)
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
        
        view.addSubview(gitLabel)
        gitLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                        left: view.leftAnchor,
                        paddingTop: 5, paddingLeft: 16)
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top: gitLabel.bottomAnchor,
                         left: view.leftAnchor,
                         paddingTop: 1, paddingLeft: 16)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: infoLabel.bottomAnchor,
                              left: view.leftAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              right: view.rightAnchor,
                              paddingTop: 20,
                              width: view.frame.width, height: 500)
    }
}

//MARK: - UICollectionView DataSource
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

