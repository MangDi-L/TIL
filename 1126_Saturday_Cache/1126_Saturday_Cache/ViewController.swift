//
//  ViewController.swift
//  1126_Saturday_Cache
//
//  Created by Mangdi on 2022/11/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageViewFirst: UIImageView!
    @IBOutlet weak var imageViewSecond: UIImageView!
    @IBOutlet weak var loadImageFirstButton: UIButton!
    @IBOutlet weak var loadImageSecondButton: UIButton!
    @IBOutlet weak var initializeImageButton: UIButton!
    @IBOutlet weak var clearCacheButton: UIButton!
    let networkManager = NetworkManager()
    let firstImageAddress = "https://wallpaperaccess.com/download/europe-4k-1369012"
    let secondImageAddress = "https://wallpaperaccess.com/download/europe-4k-1318341"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func touchUpLoadingImageButton(sender: UIButton) {
        if sender.restorationIdentifier == "loadImageFirstButton" {
            loadingImage(url: firstImageAddress, imageView: imageViewFirst)
        }
        
        if sender.restorationIdentifier == "loadImageSecondButton" {
            loadingImage(url: secondImageAddress, imageView: imageViewSecond)
        }
    }
    
    @IBAction private func initializeImage(sender: UIButton) {
        imageViewFirst.image = nil
        imageViewSecond.image = nil
    }
    
    @IBAction private func clearCache(sender: UIButton) {
        ImageCacheManager.shared.removeAllObjects()
    }
    
    private func loadingImage(url: String, imageView: UIImageView) {
        let cacheKey = NSString(string: url)
        guard let cacheValue = ImageCacheManager.shared.object(forKey: cacheKey) else {
            networkManager.loadingImage(url: url) { data in
                guard let imageData = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    imageView.image = imageData
                }
                ImageCacheManager.shared.setObject(imageData, forKey: cacheKey)
            }
            return
        }
        imageView.image = cacheValue
    }
}

