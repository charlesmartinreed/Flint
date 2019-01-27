//
//  MainCoordinator.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/26/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

protocol CoordinatorAlertDelegate {
    func displayAlert(title: String, message: String)
}

class MainCoordinator : Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var delegate: CoordinatorAlertDelegate?
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
                self.moveToProfileScreen()
            }
        })
    }
    
    func loginAttempt(username: String, password: String) {
        //if able to sign in, take user to the profile page so that they can setup username, add photo, bio info, etc.
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if let err = error {
                self.delegate?.displayAlert(title: "Oh no!", message: err.localizedDescription)
            } else {
                print("sign up successful")
                self.user = user
                self.moveToProfileScreen()
            }
        }
        
        //attempt to login
    }
}
