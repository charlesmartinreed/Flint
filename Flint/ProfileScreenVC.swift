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

    //MARK:- IBOutlet
    @IBOutlet weak var profileImageButton: ProfileImage!
    @IBOutlet weak var usernameButton: UIButton!
    @IBOutlet weak var userSegControl: UISegmentedControl!
    @IBOutlet weak var userPrefSegControl: UISegmentedControl!
    
    //MARK:- Properties
    weak var coordinator: MainCoordinator?
    weak var currentUser: PFUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentUser = coordinator?.currentUser
        usernameButton.setTitle("\(currentUser.username ?? "Username")", for: .normal)
        
    }
    
    //MARK:- IBAction
    @IBAction func changeProfileImageButtonTapped(_ sender: ProfileImage) {
        print("image button tapped")
    }
    
    @IBAction func changeUsernameButtonTapped(_ sender: UIButton) {
        print("username button tapped")
    }
    
    @IBAction func cancelButtonTapped(_ sender: CancelButton) {
        coordinator?.navigationController.popViewController(animated: true)
    }
    
    
    func saveProfileChanges() {
        //trigered when the user either leaves by clicking the X button or as soon as a change is detected in one of the interactable fields
        print("profile settings updated")
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
