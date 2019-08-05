//
//  CustomCardView.swift
//  Pinterest
//
//  Created by Amsaraj Mariappan on 3/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable open class CustomCardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
