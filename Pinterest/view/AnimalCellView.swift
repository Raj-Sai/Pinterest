//
//  AnimalCellView.swift
//  Pinterest
//
//  Created by Amsaraj Mariappan on 3/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class AnimalCellView: UICollectionViewCell {
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    @IBOutlet weak var animalName: UILabel!
    
    @IBOutlet weak var animalDetailsLabel: UILabel!
    
    @IBOutlet weak var animalHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    var animals: Animals? {
        didSet {
            if let animal = animals {
                animalImageView.image = animal.image
                animalName.text = animal.name
                animalDetailsLabel.text = animal.details
            }
        }
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            animalHeightConstraint.constant = attributes.photoHeight
        }
    }
}
