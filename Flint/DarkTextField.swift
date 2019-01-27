//
//  Button.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/27/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class DarkTextField : UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }
    
    private func setupTextField() {
        //for the time being, all I'm doing is rounding the corners and giving the border a specific shade of purple = 5D539C
        layer.borderColor = UIColor(red: 93.0/255.0, green: 83.0/255, blue: 156.0/255.0, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        attributedPlaceholder = NSAttributedString(string: "Dummy Text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
}
