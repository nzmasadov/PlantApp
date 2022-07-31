//
//  DescriptionView.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 31.07.22.
//

import UIKit

class DetailsDescriptionView: UIView {

    private lazy var titleDescriptionLbl: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "Description", textColor: UIColor.black, textAlignment: NSTextAlignment.left)
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        
        addSubview(label)
        return label
    }()
    
    private lazy var wikiInfoLbl: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "From Wikipedia, the free encyclopedia", textColor: UIColor.lightGray, textAlignment: NSTextAlignment.left)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        
        addSubview(label)
        return label
    }()
    
    private lazy var descriptionLbl: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "Papaver somniferum, commonly known as the opium poppy or breadseed poppy, is a species of flowering plant in the family Papaveraceae. It is the species of plant from which both opium and poppy seeds are dererived a... Read more", textColor: UIColor.greyTone, textAlignment: NSTextAlignment.left)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        titleDescriptionLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-20)
        }
        
        wikiInfoLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(titleDescriptionLbl.snp.bottom).offset(7)
        }
        
        descriptionLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(wikiInfoLbl.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
