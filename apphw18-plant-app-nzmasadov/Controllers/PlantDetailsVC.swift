//
//  PlantDetailsVC.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 31.07.22.
//

import UIKit

class PlantDetailsVC: UIViewController {
    
    var selectedImage: UIImage?
    
    let categories: [Categories] = [
        Categories(backgroundColor: UIColor.lightGreen, title: "Small", image: UIImage(named: "ic_ruler"), amount: "Weight"),
        Categories(backgroundColor: UIColor.lightBlueTone, title: "333ml", image: UIImage(named: "ic_water"), amount: "Water"),
        Categories(backgroundColor: UIColor.lightOrangeTone, title: "Normal", image: UIImage(named: "ic_sun"), amount: "Light"),
        Categories(backgroundColor: UIColor.lightPurpleTone, title: "56%", image: UIImage(named: "ic_humidity"), amount: "Humidity")
    ]
    
    private lazy var plantImgView: UIImageView = {
       let view = UIImageView()
        
        view.configureImage(contentMode: UIView.ContentMode.scaleAspectFill, image: self.selectedImage)
        view.isUserInteractionEnabled = true
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var cancelImgView: UIImageView = {
       let view = UIImageView()
        
        view.configureImage(contentMode: UIView.ContentMode.scaleAspectFill, image: UIImage(named: "ic_exit"))
        view.backgroundColor = .black.withAlphaComponent(0.3)
        view.clipsToBounds = true
        view.layer.cornerRadius = 17
        self.plantImgView.addSubview(view)
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
        button.setTitle("  Share this plant", for: .normal)
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
        cancelImgView.isUserInteractionEnabled = true
        cancelImgView.addTapGesture {
            self.navigationController?.popToRootViewController(animated: true)
            print("tapped")
        }
    }
    
    private func setupUI() {
        plantImgView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(250)
        }
        
        cancelImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-20)
            make.height.width.equalTo(34)
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
        let imageShare = [selectedImage]
        let activityViewController = UIActivityViewController(activityItems: imageShare as [Any] , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
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
