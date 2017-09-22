//
//  FunctionalBtn.swift
//  social-app
//
//  Created by Philipp Jahn on 06.09.17.
//  Copyright © 2017 Rollin Donkey. All rights reserved.
//
//  Copyright © icons8.com for all used icons
//

import UIKit

class FunctionalBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 2.0
    }

}
