//
//  FunctionalField.swift
//  social-app
//
//  Created by Philipp Jahn on 06.09.17.
//  Copyright © 2017 Rollin Donkey. All rights reserved.
//
//  Copyright © icons8.com for all used icons
//

import UIKit

class FunctionalField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }

}
