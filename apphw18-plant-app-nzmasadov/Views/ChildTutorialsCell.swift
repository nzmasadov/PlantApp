//
//  VideosCollectionViewCell.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 30.07.22.
//

import UIKit

class ChildTutorialsCell: UICollectionViewCell {
    static let identifier = "ChildTutorialsCell"
    
    private lazy var backImageView : UIImageView = {
        let imgView = UIImageView()
        
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 16
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "ic_play")
        contentView.addSubview(imgView)
        
        return imgView
    }()
    
    private lazy var imageView : UIImageView = {
        let imgView = UIImageView()
        
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "ic_play")
        backImageView.addSubview(imgView)
        
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "Water your Cactus today (living room)", textColor: UIColor.black, textAlignment: .left)
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        contentView.addSubview(label)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.configureLabel(text: "It’s 2 weeks old, you have to water it twice a week", textColor: UIColor.gray, textAlignment: .left)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        contentView.addSubview(label)
        return label
    }()
    
    private lazy var rightVectorImgView : UIImageView = {
        let imgView = UIImageView()
        
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "ic_right_vector")
        contentView.addSubview(imgView)
        
        return imgView
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
        
        backImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerX.equalTo(backImageView.snp.centerX)
            make.centerY.equalTo(backImageView.snp.centerY)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(backImageView.snp.right).offset(15)
            make.top.equalTo(contentView.snp.top).offset(6)
            make.right.equalTo(rightVectorImgView.snp.left).offset(-38)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backImageView.snp.right).offset(15)
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
            make.right.equalTo(titleLabel.snp.right)
        }
        
        rightVectorImgView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.centerY.equalTo(backImageView.snp.centerY)
            make.width.height.equalTo(25)
        }
    }
    
    func setUIComponents(_ tutorials: Tutorials) {
        backImageView.image = tutorials.backImg
        titleLabel.text = tutorials.title
        subtitleLabel.text = tutorials.subtitle
    }
}
