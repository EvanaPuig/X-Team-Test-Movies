//
//  SignUpViewController.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 06/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps to dismiss the view
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        passwordConfirm.delegate = self
    }
    
    /// Function that enables the user to sign up
    @IBAction func signUpAction(_ sender: Any) {
        if password.text != passwordConfirm.text {
            let alertController = UIAlertController(title: MovieAppConstants.signupIncorrectPasswordTitle, message: MovieAppConstants.signupIncorrectPasswordBody, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: MovieAppConstants.genericConfirmButton, style: .cancel, handler: nil)
                
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: MovieAppConstants.signupToHomeSegue, sender: self)
                }
                else {
                    let alertController = UIAlertController(title: MovieAppConstants.genericAlertTitle, message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: MovieAppConstants.genericConfirmButton, style: .cancel, handler: nil)
                        
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
