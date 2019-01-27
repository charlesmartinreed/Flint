//
//  MainCoordinator.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/26/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

protocol CoordinatorDelegate {
    func displayAlert(title: String, message: String)
}

class MainCoordinator : Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var delegate: CoordinatorDelegate?
    var user: PFUser?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true //we'll handle navigation by instantiating from storyboard
    }
    
    func start() {
        let vc = LoginScreenVC.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false) //false because this is our entry point
    }
    
    func moveToProfileScreen() {
        let vc = ProfileScreenVC.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func signUpAttempt(username: String, password: String) {
        user = PFUser()
        user?.username = username
        user?.password = password
        
        user?.signUpInBackground(block: { (success, error) in
            if let err = error {
                self.delegate?.displayAlert(title: "Uh-oh!", message: err.localizedDescription)
            } else {
                print("sign up successful")
                //moveToProfileScreen()
            }
        })
    }
    
    func loginAttempt(username: String, password: String) {
        //if able to sign in, take user to the profile page so that they can setup username, add photo, bio info, etc.
        user = PFUser()
        user?.username = username
        user?.password = password
        
        //attempt to login
    }
}
