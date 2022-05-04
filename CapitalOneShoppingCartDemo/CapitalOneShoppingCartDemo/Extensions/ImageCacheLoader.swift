//
//  ImageCacheLoader.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-05-03.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    func loadImageUsingCacheWithUrlString(urlString: String) {
        if let image = imageCache.object(forKey: urlString as NSString) {
            self.image = image
            return
        }
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                }
            }
        }).resume()
    }
}
