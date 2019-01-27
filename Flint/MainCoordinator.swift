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
    
    func login() {
        //attempt to login, if user exists, push them to the main screen
        print("log in pressed")
    }
    
    func signup() {
        //if able to sign in, take user to the profile page so that they can setup username, add photo, bio info, etc.
        print("sign in pressed")
    }
}
