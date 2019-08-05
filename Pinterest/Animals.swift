//
//  Animals.swift
//  Pinterest
//
//  Created by Amsaraj Mariappan on 3/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class Animals {
    
    class func allPhotos() -> [Animals] {
        var photos = [Animals]()
        if let URL = Bundle.main.url(forResource: "Animals", withExtension: "plist") {
            if let photosFromPlist = NSArray(contentsOf: URL) {
                for dictionary in photosFromPlist {
                    let photo = Animals(dictionary: dictionary as! NSDictionary)
                    photos.append(photo)
                }
            }
        }
        return photos
    }
    
    var name: String
    var details: String
    var image: UIImage
    
    init(name: String, details: String, image: UIImage) {
        self.name = name
        self.details = details
        self.image = image
    }
    
    convenience init(dictionary: NSDictionary) {
        let name = dictionary["name"] as? String
        let details = dictionary["details"] as? String
        let photo = dictionary["image"] as? String
        let image = UIImage(named: photo!)?.decompressedImage
        self.init(name: name!, details: details!, image: image!)
    }
    
    func heightForComment(_ font: UIFont, width: CGFloat, pDetails: String) -> CGFloat {
        let rect = NSString(string: pDetails).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)
    }
    
}

extension UIImage {
    
    var decompressedImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(at: CGPoint.zero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage!
    }
    
}
