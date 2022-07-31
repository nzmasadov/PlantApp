//
//  DetailsTopView.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 31.07.22.
//

import UIKit

class DetailsTopView: UIView {
    
    
    private lazy var checkedImgView: UIImageView = {
       let view = UIImageView()
        
        view.configureImage(contentMode: UIView.ContentMode.scaleAspectFit, image: UIImage(named: "ic_tik"))
        self.addSubview(view)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "Hurray, we identified the plant!", textColor: UIColor.brightGreen, textAlignment: NSTextAlignment.left)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var nameLbl: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "Papaver Somniverum", textColor: UIColor.black, textAlignment: NSTextAlignment.left)
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.numberOfLines = 0
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 0
        
        self.addSubview(stack)
        return stack
    }()
    
    private lazy var grayFilledLabel1: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "Indoor", textColor: UIColor.gray, textAlignment: NSTextAlignment.center)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.backgroundColor = .lightGreyTone
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var grayFilledLabel2: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "Pet friendly", textColor: UIColor.gray, textAlignment: NSTextAlignment.center)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.backgroundColor = .lightGreyTone
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var grayFilledLabel3: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "Papaveraceae", textColor: UIColor.gray, textAlignment: NSTextAlignment.center)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.backgroundColor = .lightGreyTone
        label.numberOfLines = 0
        
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
        
        stackView.addArrangedSubview(grayFilledLabel1)
        stackView.addArrangedSubview(grayFilledLabel2)
        stackView.addArrangedSubview(grayFilledLabel3)
        
        checkedImgView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(30)
            make.width.height.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(checkedImgView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-20)
//            make.top.equalToSuperview().offset(30)
            make.centerY.equalTo(checkedImgView.snp.centerY)
        }
        
        nameLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        grayFilledLabel1.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(69)
        }
        
        grayFilledLabel2.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(97)

        }
        grayFilledLabel3.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(112)

        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
//            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(nameLbl.snp.bottom).offset(20)
        }
    }
}
