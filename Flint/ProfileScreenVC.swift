//
//  ProfileScreenVC.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/27/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

class ProfileScreenVC: UIViewController, Storyboarded {

    //MARK:- Properties
    weak var coordinator: MainCoordinator?
    weak var user: PFUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = coordinator?.user
        
        print("Welcome, \(user?.username ?? "user not found")")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
