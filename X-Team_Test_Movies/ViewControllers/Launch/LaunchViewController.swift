//
//  LaunchViewController.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 06/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import UIKit
import Firebase

class LaunchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: MovieAppConstants.alreadyLoggedInSegue, sender: nil)
        }
    }
}
