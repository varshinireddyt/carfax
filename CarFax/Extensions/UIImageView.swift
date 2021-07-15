//
//  UIImageView.swift
//  CarFax
//
//  Created by Varshini Thatiparthi on 7/15/21.
//

import UIKit
let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func getImage(from urlString: String) {
        self.image = nil
        guard let url = URL(string: urlString) else { return }
        
        if let image = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = image
        } else {
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    self.image = image
                    self.contentMode = .scaleAspectFill
                }
                
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
            }
            
            dataTask.resume()
        }
    }
}
