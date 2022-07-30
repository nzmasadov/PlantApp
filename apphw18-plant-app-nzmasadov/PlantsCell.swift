//
//  MainCollectionViewCell.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 27.07.22.
//

import UIKit

class PlantsCell: UICollectionViewCell {
    
    static let identifier = "PlantsCell"
    
    var plants: [Plants] = [
        Plants(name: "Peperomia Houseplant", image: UIImage(named: "ic_plant_aloa")),
        Plants(name: "Asplenium Houseplant", image: UIImage(named: "ic_plant_2"))
    ]
    
    private lazy var headerView : HeaderReusableView = {
        let view = HeaderReusableView()
        
        view.titleLabel.text = "Popular plants"
        contentView.addSubview(view)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.bounces = true
        collection.alwaysBounceHorizontal = true
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = .init(top: 0, left: 0, bottom: 0, right: 20)
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
    
        collectionView.register(ChildPlantsCell.self, forCellWithReuseIdentifier: ChildPlantsCell.identifier)
  
        headerView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(30)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.right.left.equalToSuperview()
        }
    }
}

extension PlantsCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildPlantsCell.identifier, for: indexPath) as! ChildPlantsCell
        
        cell.setUIComponents(plants[indexPath.row])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 187)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
}
