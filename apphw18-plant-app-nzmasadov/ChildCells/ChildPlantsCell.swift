//
//  PlantsCollectionViewCell.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 24.07.22.
//

import UIKit
import SnapKit

class ChildPlantsCell: UICollectionViewCell {
  
    static let identifier = "ChildPlantsCell"
    
    private lazy var grayView : UIView = {
        let view = UIView()
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .lightGray.withAlphaComponent(0.1)
        contentView.addSubview(view)
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        
        label.configureLabel(label: label, textColor: UIColor.greenTone, textAlignment: .left)
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        grayView.addSubview(label)
        return label
    }()
    
    private lazy var imageView : UIImageView = {
        let imgView = UIImageView()

        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "ic_plant_2")
        contentView.addSubview(imgView)
        return imgView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()

        label.configureLabel(label: label, textColor: UIColor.black, textAlignment: .left)
        label.numberOfLines = 2
        label.text = "Peperomia \nHouseplan"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        grayView.addSubview(label)
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 16
        
        grayView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(snp.bottom)
            make.width.equalTo(179)
            make.height.equalTo(130)
        }
        
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.right.equalTo(contentView.snp.right).offset(10)
            make.width.equalTo(144)
            make.height.equalTo(144)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.bottom.equalTo(nameLabel.snp.top).offset(-5)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(grayView.snp.left).offset(12)
            make.bottom.equalTo(grayView.snp.bottom).offset(-12)
            make.width.equalTo(89)
        }
    }
    
    func setUIComponents(_ plants: Plants) {
        nameLabel.text = plants.name
        imageView.image = plants.image
    }
}
