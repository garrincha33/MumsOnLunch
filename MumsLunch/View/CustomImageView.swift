//
//  CustomImageView.swift
//  MumsLunch
//
//  Created by Richard Price on 15/10/2020.
//

import UIKit

class CustomImageView: UIImageView {
    
    let placeHolderImage = UIImage(named: "placeholder_img")
    let cache = NetworkManager.shared.imageCache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImage()
        
    }
    
    private func setupImage() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from URLString: String) {
        
        let cacheKey = NSString(string: URLString)
        //create cache
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: URLString) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 2 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
    
    required init?(coder: NSCoder) {
        fatalError("dont care about storyboards")
    }
    
}
