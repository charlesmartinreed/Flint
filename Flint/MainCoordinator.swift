//
//  MainCoordinator.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/26/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class MainCoordinator : Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true //we'll handle navigation by instantiating from storyboard
    }
    
    func start() {
        let vc = LoginScreenVC.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false) //false because this is our entry point
    }
    
    func login(user: String, password: String) -> (success: Bool, details: String) {
        //attempt to login, if user exists, push them to the main screen
        if !user.isEmpty && !password.isEmpty {
            print("log in pressed")
            return (true, "")
        } else {
            return (false, "Dummy error: This user does not currently exist.")
        }
        
    }
    
    func signup(user: String, password: String) -> (success: Bool, details: String) {
        //if able to sign in, take user to the profile page so that they can setup username, add photo, bio info, etc.
        
        if !user.isEmpty && !password.isEmpty {
            //try to log in with the credentials here
            print("sign in pressed")
            return (true, "")
        } else {
            //grab the error message from Parse here
            return (false, "Dummy error: Unable to sign up... for reasons.")
        }
    }
}
