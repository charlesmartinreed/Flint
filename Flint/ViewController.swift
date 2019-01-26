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
    
    //MARK:- Properties

    override func viewDidLoad() {
        let testObject = PFObject(className: "Test")
        testObject["foo"] = "bar"
        testObject.saveInBackground { (success, error) in
            if let err = error {
                print(err.localizedDescription)
            } else {
                print("object has been successfully saved")
            }
        }
        super.viewDidLoad()
        
        
    }

}

