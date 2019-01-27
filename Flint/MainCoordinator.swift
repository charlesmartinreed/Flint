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
}
