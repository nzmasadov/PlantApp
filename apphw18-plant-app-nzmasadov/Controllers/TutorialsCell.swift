//
//  Main3CollectionViewCell.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 30.07.22.
//

import UIKit

class TutorialsCell: UICollectionViewCell {
    static let identifier = "TutorialsCell"
    
    var viewController: UIViewController?
    
    var tutorials: [Tutorials] = [
        Tutorials(title: "Water your Cactus today (living room)", subtitle: "It’s 2 weeks old, you have to water it twice a week", backImg: UIImage(named: "ic_cactus"), videoUrl: URL(string: "https://firebasestorage.googleapis.com/v0/b/paycheap-39445.appspot.com/o/video1.mp4?alt=media&token=34a23140-eb3d-440d-bb72-09013b1835fb")),
        Tutorials(title: "Prune the dead branches of Bamboo too weak ", subtitle: "It’s been 2-3 weeks since you have prune the dead ", backImg: UIImage(named: "ic_leaf"),  videoUrl: URL(string: "https://firebasestorage.googleapis.com/v0/b/paycheap-39445.appspot.com/o/video2.mp4?alt=media&token=ae74a642-ab75-4e2b-a7da-cbd97295c457"))
    ]
    
    private lazy var headerView : HeaderReusableView = {
        let view = HeaderReusableView()
        
        view.titleLabel.text = "Tutorials for today"
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
        collectionView.register(ChildTutorialsCell.self, forCellWithReuseIdentifier: ChildTutorialsCell.identifier)

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

extension TutorialsCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildTutorialsCell.identifier, for: indexPath) as! ChildTutorialsCell
            cell.setUIComponents(tutorials[indexPath.row])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = VideoPlayevVC()
        vc.videoTitle = self.tutorials[indexPath.row].title
        vc.videoUrl = self.tutorials[indexPath.row].videoUrl
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
