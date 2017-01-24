//
//  SignInVC.swift
//  SignIn
//
//  Created by Abed on 23/01/2017.
//  Copyright © 2017 Webiaturist. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginPressed(_ sender: Any) {
        
        let pass = passwordField.text
        let email = emailField.text
        
        if pass == "" || email == ""{
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            
        } else{
            
            FIRAuth.auth()?.signIn(withEmail: email!, password: pass!) { (user, error) in
                
                if error == nil{
                    
                    print("Abed: Successfully logged in")
                    
                } else{
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            }
            
        }
        
        
    }
   

}

