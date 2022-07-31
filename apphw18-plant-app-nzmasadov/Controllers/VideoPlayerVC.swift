//
//  VideoPlayevVC.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 31.07.22.
//

import UIKit
import AVFoundation
import AVKit

class VideoPlayerVC: UIViewController {
    
    var videoTitle: String?
    var videoUrl: URL?
    private var player: AVPlayer?
    
    private lazy var playerViewController: AVPlayerViewController = {
        return AVPlayerViewController()
    }()
    
    private lazy var videoView: UIView = {
       let view = UIView()
        
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.configureLabel(text: self.videoTitle ?? "", textColor: UIColor.black, textAlignment: NSTextAlignment.left)
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        
        self.view.addSubview(label)
        return label
    }()
    
    private lazy var shareBtn: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "ic_bookmark"), for: .normal)
        button.setTitle("  Share this video", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = .brightGreen
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        
        self.view.addSubview(button)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        videoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(self.videoView.snp.width).multipliedBy(0.6)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(videoView.snp.bottom).offset(20)
            make.left.equalTo(videoView.snp.left)
            make.right.equalTo(videoView.snp.right)
        }
        
        shareBtn.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        videoView.addSubview(playerViewController.view)
        
        playerViewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.playerViewController.player = AVPlayer(url: self.videoUrl!)
    }
    
    @objc func shareTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
