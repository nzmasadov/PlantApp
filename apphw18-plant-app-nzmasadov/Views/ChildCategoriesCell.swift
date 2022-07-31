//
//  CategoryCollectionViewCell.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 29.07.22.
//

import Foundation
import UIKit

class ChildCategoriesCell: UICollectionViewCell {
    
    static let identifier = "ChildCategoriesCell"
    
    private lazy var backView : UIView = {
        let view = UIView()
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .lightGreen
        contentView.addSubview(view)
        return view
    }()
    
    private lazy var imageView : UIImageView = {
        let imgView = UIImageView()
        
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "ic_sofa")
        backView.addSubview(imgView)
        
        return imgView
    }()
    
    private lazy var plantAmountLbl: UILabel = {
        let label = UILabel()
        
        label.configureLabel(label: label, text: "3 Plants", textColor: UIColor.blueTone, textAlignment: .left)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        contentView.addSubview(label)
        return label
    }()
    
    private lazy var fieldLabel: UILabel = {
        let label = UILabel()
        
        label.configureLabel(label: label, text: "Living Room", textColor: UIColor.black, textAlignment: .left)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        contentView.addSubview(label)
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
        
        backView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.centerX.equalTo(backView.snp.centerX)
            make.centerY.equalTo(backView.snp.centerY)
        }
        
        plantAmountLbl.snp.makeConstraints { make in
            make.left.equalTo(backView.snp.right).offset(14)
            make.top.equalTo(contentView.snp.top).offset(8)
        }
        
        fieldLabel.snp.makeConstraints { make in
            make.left.equalTo(backView.snp.right).offset(14)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
    }
    
    func setUIComponents(_ category: Categories) {
        backView.backgroundColor = category.backgroundColor
        imageView.image = category.image
        plantAmountLbl.text = "\(category.amount ?? 0) Plants"
        fieldLabel.text = category.title
    }
}
