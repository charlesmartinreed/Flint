//
//  LoginScreenVC.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/26/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class LoginScreenVC: UIViewController, Storyboarded {
    
    //MARK:- Properties
    var animationColors: [UIColor] = [UIColor.hexFF8F56, UIColor.hexFF5959, UIColor.hex984A59, UIColor.hex60424C]
    weak var coordinator: MainCoordinator?
    var currentColorIndex = 0
    var colorShiftTimer: Timer!
    var colorShiftDuration: TimeInterval = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.setGradientBackground(colors: animationColors)
//        view.backgroundColor = animationColors[0] //starts at 0
//        colorShiftTimer = Timer.scheduledTimer(timeInterval: colorShiftDuration, target: self, selector: #selector(animateBackgroundColorAndAlpha), userInfo: nil, repeats: true)
        //animateBackgroundWith(colors: animationColors)
    }
    
//    @objc func animateBackgroundWith(timer: Timer) {
//        let colors = timer.userInfo as! [UIColor]
//        currentColorIndex += 1
//
//        if currentColorIndex < colors.count {
//            view.backgroundColor = colors[currentColorIndex]
//
//            print("color changed")
//        } else {
//            currentColorIndex = 0
//        }
    
        @objc func animateBackgroundColorAndAlpha() {
            UIView.animate(withDuration: colorShiftDuration, animations: {
                let colorA = self.animationColors[0]
                self.view.backgroundColor = colorA
                self.view.alpha = 0.1
            }) { (_) in
                let colorB = self.animationColors[1]
                self.view.backgroundColor = colorB
                self.view.alpha = 1
            }
        }
    }




