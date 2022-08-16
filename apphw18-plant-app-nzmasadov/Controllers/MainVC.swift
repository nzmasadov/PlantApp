//
//  ViewController.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 24.07.22.
//

import UIKit
import SnapKit
import YPImagePicker

protocol ImageSelectionDelegate: AnyObject {
    func didSelectImage(image: UIImage)
}

class MainVC: UIViewController {
    
    var items = [
        Item(type: .popular, plantName: "Popular plants", viewAll: "View all"),
        Item(type: .category, plantName: "Categories", viewAll: "View all"),
        Item(type: .tutorial, plantName: "Tutorials for today", viewAll: "View all")
    ]
    
    weak var delegate: ImageSelectionDelegate?
    
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
        
        collectionConfiguration()
        
//        mainCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func searchAction() {
        print("search")
    }
    
    @objc func addAction() {
        let vc = PlantDetailsVC()
        vc.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func scanBtnTapped() {
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo]
        config.library.mediaType = .photo
        config.library.maxNumberOfItems = 2
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { items, cancelled in
            if cancelled {
                picker.dismiss(animated: true)
                return
            }
            
            items.forEach { item in
                switch item {
                case .photo(let photoItem):
//                    print("Image source (camera or library) -> \(photoItem.fromCamera)  Final image selected by the user -> \(photoItem.image) original image selected by the user, unfiltered -> \(photoItem.originalImage) Transformed image, can be nil -> \(photoItem.modifiedImage) Print exif meta data of original image-> \(photoItem.exifMeta)")
                    let vc = PlantDetailsVC()
                    vc.selectedImage = photoItem.image
                    self.navigationController?.pushViewController(vc, animated: true)
                case .video(_):
                    break
                }
            }
            picker.dismiss(animated: true)
        }
        self.present(picker, animated: true)
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
    
    fileprivate func collectionConfiguration() {
        mainCollectionView.register(PlantsCell.self, forCellWithReuseIdentifier: "\(PlantsCell.self )")
        mainCollectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: "\(CategoriesCell.self)")
        mainCollectionView.register(TutorialsCell.self, forCellWithReuseIdentifier: "\(TutorialsCell.self)")
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch items[indexPath.row].type {
        case .popular:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PlantsCell.self)", for: indexPath) as! PlantsCell
            cell.configureHeader(title: items[indexPath.row].plantName ?? "")
            return cell
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoriesCell.self)", for: indexPath) as! CategoriesCell
            cell.configureHeader(title: items[indexPath.row].plantName ?? "")
            return cell
        case .tutorial:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TutorialsCell.self)", for: indexPath) as! TutorialsCell
            cell.configureHeader(title: items[indexPath.row].plantName ?? "")
            cell.mainVC = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch items[indexPath.row].type {
        case .popular:
           return CGSize(width: self.view.frame.width - 40, height: 207)
        case .category:
            return CGSize(width: self.view.frame.width - 40, height: 180)
        case .tutorial:
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
