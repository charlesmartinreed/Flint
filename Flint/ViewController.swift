//
//  ViewController.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/20/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var swipeImageView: UIImageView!
    
    //MARK:- Properties
    let imageViewOffsetFromTop: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //swiping is handled with a pan gesture recognizer
        setupSwipeFor(item: swipeImageView)
    }
    
    func setupSwipeFor(item: AnyObject) {
        //obviously way more involved code than is necessary, just screwing around here.
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(itemWasDragged(recognizer:)))
        
        if let item = item as? UIImageView {
            item.isUserInteractionEnabled = true
            item.addGestureRecognizer(gesture)
        }
    }
    
    @objc func itemWasDragged(recognizer: UIPanGestureRecognizer) {
        let screenWidth = view.bounds.width
        let screenHeight = view.bounds.height
        
        let upddatedItemPoint = recognizer.translation(in: view) //where the user is trying to move to
        
        swipeImageView.center = CGPoint(x: screenWidth / 2 + upddatedItemPoint.x, y: screenHeight / 2 + upddatedItemPoint.y)
        
        if recognizer.state == .ended {
            //did the user swipe far enough to the left or right?
            if swipeImageView.center.x < screenWidth / 2 - (swipeImageView.frame.width * 0.25) {
                print("Swiped left! Not interested!")
            }
            
            if swipeImageView.center.x > screenWidth / 2 + (swipeImageView.frame.width * 0.25) {
                print("Swiped right! So thirsty!")
            }
            
            swipeImageView.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2 - imageViewOffsetFromTop)
        }
    }

}

