//
//  ViewController.swift
//  Pinterest
//
//  Created by Amsaraj Mariappan on 3/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit
import AVFoundation

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}

class ViewController: UICollectionViewController {
    
    var photos = Animals.allPhotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "AnimalCellView", bundle:nil)
        
        collectionView.register(nibName, forCellWithReuseIdentifier: "AnimalCellView")
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
      
        
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "horse"))
        
        collectionView!.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        if #available(iOS 11.0, *) {
            collectionView?.contentInsetAdjustmentBehavior = .always
        }
    }
}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCellView", for: indexPath) as! AnimalCellView
        cell.animals = photos[(indexPath as NSIndexPath).item]
        return cell
    }
}

extension ViewController : PinterestLayoutDelegate {
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        let photo = photos[(indexPath as NSIndexPath).item]
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRect(aspectRatio: photo.image.size, insideRect: boundingRect)
        return rect.size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let annotationPadding = CGFloat(4)
        let annotationHeaderHeight = CGFloat(17)
        let photo = photos[(indexPath as NSIndexPath).item]
        let font = UIFont(name: "AvenirNext-Regular", size: 12)!
        let commentHeight = photo.heightForComment(font, width: width, pDetails: photo.details)
        
        let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
        return height
    }
}



