//
//  UIButton+Extension.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/27/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class ProfileImage : UIButton {
    //circular image, white border,
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProfileImageBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupProfileImageBtn()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageView?.contentMode = .scaleAspectFill
            imageView?.clipsToBounds = true
        }
    }
    
    func setupProfileImageBtn() {
        //frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        
        layer.cornerRadius = frame.size.height / 2
        layer.borderColor = UIColor.hex132238.cgColor
        layer.borderWidth = 5
        layer.masksToBounds = true
    }
}

class CancelButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageView?.contentMode = .scaleAspectFill
            imageView?.clipsToBounds = true
        }
    }
}
