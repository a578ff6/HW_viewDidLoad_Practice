//
//  ViewController.swift
//  HW_viewDidLoad_Practice
//
//  Created by 曹家瑋 on 2023/4/21.
//


import UIKit
import AVFoundation
import SpriteKit
import AVKit

class ViewController: UIViewController {

    var musicLooper: AVPlayerLooper?
    var videoLooper: AVPlayerLooper?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景音樂
        if let musicUrl = URL(string: "https://www.googleapis.com/drive/v3/files/1W3LlqkJ6UH3ZnUTlCTuDg_2uWTmCDwI6?alt=media&key=AIzaSyBM1JnQE_STOW0dNrz0G4YtQ1NyS6CbhBA") {
            let musicPlayer = AVQueuePlayer()
            let muiscItem = AVPlayerItem(url: musicUrl)
            musicLooper = AVPlayerLooper(player: musicPlayer, templateItem: muiscItem)
            musicPlayer.play()
        }
        
        // Mask遮罩
        let dqImage = UIImage(named: "Dragon_Quest_Logo")
        let dqImageView = UIImageView(image: dqImage)
        dqImageView.transform = CGAffineTransform(scaleX: 1, y: 1.3)
        let videoView = UIView(frame: CGRect(origin: CGPoint(x: 180, y: 60), size: dqImageView.frame.size))
        view.addSubview(videoView)
        
        // 影片重複播放
        if let dqUrl = URL(string: "https://www.googleapis.com/drive/v3/files/1Jmbaz45eSurXYDvQ5Z8lpsv1hnk36l3w?alt=media&key=AIzaSyBM1JnQE_STOW0dNrz0G4YtQ1NyS6CbhBA") {
            let videoItem = AVPlayerItem(url: dqUrl)
            let videoPlayer = AVQueuePlayer()
            videoLooper = AVPlayerLooper(player: videoPlayer, templateItem: videoItem)
            let videoPlayerViewController = AVPlayerViewController()
            videoPlayerViewController.player = videoPlayer
            present(videoPlayerViewController, animated: true, completion: {
                videoPlayerViewController.player?.play()
            })
            
            let videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
            videoPlayerLayer.frame = CGRect(origin: .zero, size: dqImageView.frame.size)
            videoPlayerLayer.videoGravity = .resizeAspectFill
            videoView.layer.addSublayer(videoPlayerLayer)
            videoView.mask = dqImageView
            videoPlayer.play()

        }

        // 濺射
        let spriteView = SKView(frame: view.frame)
        view.insertSubview(spriteView, at: 0)
        spriteView.backgroundColor = .clear
        let spriteScene = SKScene(size: spriteView.frame.size)
        spriteScene.backgroundColor = UIColor.clear
        spriteScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let emitterNode = SKEmitterNode(fileNamed: "SnowParticle")
        spriteScene.addChild(emitterNode!)
        spriteView.presentScene(spriteScene)
        
        // Load Gif
        let loadImageView = UIImageView(frame: CGRect(x: 380, y: 196, width: 130, height: 130))
        loadImageView.transform = CGAffineTransform(scaleX: 1, y: 1)

        view.addSubview(loadImageView)
        let loadAnimatedImage = UIImage.animatedImageNamed("load-", duration: 8)
        loadImageView.image = loadAnimatedImage
        
        // 背景漸層
        let grandientLayer = CAGradientLayer()
        grandientLayer.frame = view.bounds
        grandientLayer.colors = [
            CGColor(srgbRed: 153/255, green: 204/255, blue: 1, alpha: 0.8),
            CGColor(srgbRed: 153/255, green: 1, blue: 204/255, alpha: 0.5)
        ]
        view.layer.insertSublayer(grandientLayer, at: 0)
        
    }


}

