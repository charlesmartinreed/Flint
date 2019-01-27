//
//  LoginScreenVC.swift
//  Flint
//
//  Created by Charles Martin Reed on 1/26/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class LoginScreenVC: UIViewController, Storyboarded {
    
    //MARK:- IBOutlets
    @IBOutlet weak var flintLogoLabel: UILabel!
    @IBOutlet weak var usernameTextField: DarkTextField!
    @IBOutlet weak var passwordTextField: DarkTextField!
    
    //MARK:- Properties
    var animationColors: [UIColor] = [UIColor.hexFF8F56, UIColor.hexFF5959, UIColor.hex984A59, UIColor.hex60424C]
    weak var coordinator: MainCoordinator?
    var currentColorIndex = 0
    var colorShiftTimer: Timer!
    var colorShiftDuration: TimeInterval = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(colors: animationColors)
        
        //set the placeholder text - might want to refactor this
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    //MARK:- IBActions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        coordinator?.login()
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        coordinator?.signup()
    }
    
    
    
}




