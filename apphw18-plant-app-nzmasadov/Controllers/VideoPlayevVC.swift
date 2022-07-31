//
//  VideoPlayevVC.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 31.07.22.
//

import UIKit
import AVFoundation
import AVKit

class VideoPlayevVC: UIViewController {
    
    var videoTitle: String?
    var videoUrl: URL?
    private var player: AVPlayer?
    
    
    
    private lazy var playerViewController: AVPlayerViewController = {
        return AVPlayerViewController()
    }()
    
    private lazy var videoView: UIView = {
       let view = UIView()
        
        view.backgroundColor = .systemCyan
        
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        videoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(self.videoView.snp.width).multipliedBy(0.5)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(videoView.snp.bottom).offset(20)
            make.left.equalTo(videoView.snp.left)
            make.right.equalTo(videoView.snp.right)
        }
        
        videoView.addSubview(playerViewController.view)
        
        playerViewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        print(videoUrl)
        self.playerViewController.player = AVPlayer(url: self.videoUrl!)
    }
    
    
}
