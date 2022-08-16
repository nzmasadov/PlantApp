//
//  Main2CollectionViewCell.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 30.07.22.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    let categories: [Categories] = [
        Categories(backgroundColor: UIColor.lightGreen, title: "Living Room", image: UIImage(named: "ic_grid"), amount: "2 Plants"),
        Categories(backgroundColor: UIColor.lightBlueTone, title: "Kitchen", image: UIImage(named: "ic_coffee"), amount: "1 Plant"),
        Categories(backgroundColor: UIColor.lightOrangeTone, title: "Drawing Room", image: UIImage(named: "ic_sofa"), amount: "2 Plants"),
        Categories(backgroundColor: UIColor.lightPurpleTone, title: "Backyard", image: UIImage(named: "ic_backyard"), amount: "8 Plants")
    ]
    
    private lazy var headerView : HeaderReusableView = {
        let view = HeaderReusableView()
        
        contentView.addSubview(view)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.bounces = true
        collection.alwaysBounceVertical = true
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = .init(top: 15, left: 0, bottom: 15, right: 0)
        collection.delegate = self
        collection.dataSource = self
        
        self.contentView.addSubview(collection)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        collectionView.register(ChildCategoriesCell.self, forCellWithReuseIdentifier:  "\(ChildCategoriesCell.self)")
        
        headerView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(30)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.right.left.equalToSuperview()
        }
    }
    
    func configureHeader(title: String) {
        headerView.titleLabel.text = title
    }
}

extension CategoriesCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ChildCategoriesCell.self)", for: indexPath) as! ChildCategoriesCell
        
            cell.setUIComponents(categories[indexPath.row])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (self.frame.width / 2) - 5, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
