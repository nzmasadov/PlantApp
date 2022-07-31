//
//  ViewController.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 24.07.22.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    var items: [Item] = [
        Item(leftText: "Popular plants", rightText: "View all"),
        Item(leftText: "Categories", rightText: "View all"),
        Item(leftText: "Tutorials for today", rightText: "View all")
    ]
    
    private lazy var mainCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        //        flowLayout.minimumInteritemSpacing = 12        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.alwaysBounceVertical = true
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = false
        collection.contentInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        collection.delegate = self
        collection.dataSource = self
        
        self.view.addSubview(collection)
        return collection
    }()
    
    private lazy var scanBtn: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "ic_scan"), for: .normal)
        button.setTitle("  Scan and identify the plant", for: .normal)
        button.setTitleColor(UIColor.fakeGreenTone, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = .lightGreen
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(scanBtnTapped), for: .touchUpInside)
        
        self.view.addSubview(button)
        return button
    }()
    
    //MARK: - Pattern Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "ic_add"), style: .plain, target: self, action: #selector(addAction)),
            UIBarButtonItem(image: UIImage(named: "ic_search"), style: .plain, target: self, action: #selector(searchAction))
        ]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "My Plants", style: .done, target: self, action: nil)
        
        mainCollectionView.register(PlantsCell.self, forCellWithReuseIdentifier: PlantsCell.identifier)
        mainCollectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.identifier)
        mainCollectionView.register(TutorialsCell.self, forCellWithReuseIdentifier: TutorialsCell.identifier)
        
//        mainCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        setupUI()
    }
    
    @objc func searchAction() {
        print("search")
    }
    
    @objc func addAction() {
        print("add")
    }
    
    @objc func scanBtnTapped() {
        print("scanBtnTapped")
        let vc = PlantDetailsVC()
        vc.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupUI() {
        mainCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        scanBtn.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}


extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantsCell.identifier, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.identifier, for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialsCell.identifier, for: indexPath) as! TutorialsCell
            cell.mainVC = self
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantsCell.identifier, for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.row {
        case 0:
           return CGSize(width: self.view.frame.width - 40, height: 207)
        case 1:
            return CGSize(width: self.view.frame.width - 40, height: 180)
        case 2:
            return CGSize(width: self.view.frame.width - 40, height: 180)
        default:
            return CGSize(width: self.view.frame.width - 40, height: 180)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            let view =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
//            view.viewLabel.text = "kcslkd"
//            view.titleLabel.text = "sfvcc"
//            return view
//        }else {
//            return UICollectionReusableView()
//        }
//
//    }
////
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        CGSize(width: collectionView.frame.width, height: 30)
//    }
}
