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
        print("dragged!")
    }

}

