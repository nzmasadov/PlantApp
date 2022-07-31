//
//  HeaderView.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 30.07.22.
//

import Foundation
import UIKit

class HeaderReusableView: UIView {
    
//    static let identifier = "HeaderReusableView"
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()

        label.configureLabel(label: label, text: "Popular plants", textColor: UIColor.black, textAlignment: NSTextAlignment.left)
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)

        self.addSubview(label)
        return label
    }()

    lazy var viewLabel: UILabel = {
       let label = UILabel()

        label.configureLabel(label: label, text: "View all", textColor: UIColor.greenTone, textAlignment: NSTextAlignment.right)
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        self.addSubview(label)
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
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
        }
        
        viewLabel.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
        }
    }
}
