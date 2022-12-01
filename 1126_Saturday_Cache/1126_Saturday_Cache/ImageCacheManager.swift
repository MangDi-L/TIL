//
//  ImageCacheManager.swift
//  1126_Saturday_Cache
//
//  Created by Mangdi on 2022/11/26.
//

import Foundation
import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() { }
}
