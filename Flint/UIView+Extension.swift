//
//  UIView+Extension.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/26/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientBackground(colors: [UIColor]) {
        
        let gradientLayer = CAGradientLayer()
        let startingLocations: [NSNumber] = [0.0, 0.3, 0.5, 0.7]
        let endingLocations: [NSNumber] = [0.3, 0.5, 0.7, 0.9]
        
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = startingLocations
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.50)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        let gradientLocationAnimation = CABasicAnimation(keyPath: "locations")
        gradientLocationAnimation.fromValue = startingLocations
        gradientLocationAnimation.toValue = endingLocations
        gradientLocationAnimation.duration = 8.0
        gradientLocationAnimation.autoreverses = true
        gradientLocationAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        gradientLocationAnimation.repeatCount = Float.infinity
        gradientLayer.add(gradientLocationAnimation, forKey: "locations")
        
    }
}
