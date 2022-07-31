//
//  PlantDetailsVC.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 31.07.22.
//

import UIKit

class PlantDetailsVC: UIViewController {
    
    // change nzm
    let categories: [Categories] = [
        Categories(backgroundColor: UIColor.lightGreen, title: "Living Room", image: UIImage(named: "ic_grid"), amount: 2),
        Categories(backgroundColor: UIColor.lightBlueTone, title: "Kitchen", image: UIImage(named: "ic_coffee"), amount: 1),
        Categories(backgroundColor: UIColor.lightOrangeTone, title: "Drawing Room", image: UIImage(named: "ic_sofa"), amount: 2),
        Categories(backgroundColor: UIColor.lightPurpleTone, title: "Backyard", image: UIImage(named: "ic_backyard"), amount: 8)
    ]
    
    private lazy var plantImgView: UIImageView = {
       let view = UIImageView()
        
        view.configureImage(contentMode: UIView.ContentMode.scaleAspectFill, image: UIImage(named: "testImage"))
        self.view.addSubview(view)
        return view
    }()
        
    private lazy var contentView: UIView = {
       let view = UIView()
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var detailsTopView: DetailsTopView = {
       let view = DetailsTopView()
        
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var detailsDescriptionView: DetailsDescriptionView = {
       let view = DetailsDescriptionView()
        
        self.contentView.addSubview(view)
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
    
    private lazy var shareBtn: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "ic_bookmark"), for: .normal)
        button.setTitle("  Share this video", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = .brightGreen
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        
        self.contentView.addSubview(button)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationController?.navigationBar.isHidden = true
        collectionView.register(ChildCategoriesCell.self, forCellWithReuseIdentifier: ChildCategoriesCell.identifier)
    }
    
    private func setupUI() {
        
        plantImgView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(250)
        }
        
        contentView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(plantImgView.snp.bottom).offset(-5)
        }
        
        detailsTopView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(150)
        }
        
        detailsDescriptionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(detailsTopView.snp.bottom).offset(10)
            make.height.equalTo(170)
        }
        
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().offset(20)
            make.top.equalTo(detailsDescriptionView.snp.bottom).offset(10)
            make.height.equalTo(180)
        }
        
        shareBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().offset(-32)
        }
    }
    
    @objc func shareTapped() {
            }
}

extension PlantDetailsVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildCategoriesCell.identifier, for: indexPath) as! ChildCategoriesCell
        
            cell.setUIComponents(categories[indexPath.row])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (self.contentView.frame.width / 2) - 5, height: 50)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
    
}
