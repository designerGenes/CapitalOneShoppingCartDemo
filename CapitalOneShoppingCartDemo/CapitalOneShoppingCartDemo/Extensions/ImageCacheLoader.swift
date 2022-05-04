//
//  ImageCacheLoader.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-05-03.
//

import Foundation
import UIKit

typealias ImageCacheLoaderCompletionHandler = ((UIImage) -> ())

class ImageCacheLoader {
    
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        self.cache = NSCache()
    }
    
    func obtainImageWithPath(imagePath: String,
                             completionHandler: @escaping ImageCacheLoaderCompletionHandler) {
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            //placeholder image
            DispatchQueue.main.async {
                completionHandler(UIImage(systemName: "photo")!)
            }
            let url: URL! = URL(string: imagePath)
            let task = URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: imagePath as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            })
            task.resume()
        }
    }
}

