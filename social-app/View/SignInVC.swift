//
//  ViewController.swift
//  social-app
//
//  Created by Philipp Jahn on 03.09.17.
//  Copyright © 2017 Rollin Donkey. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var passwordField: FunctionalField!
    
    @IBOutlet weak var emailField: FunctionalField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print ("Admin: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print ("Admin: User cancelled Facebook authentication")
            } else {
                print ("Admin: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Admin: Unable to authenticate with Firebase -\(String(describing: error))")
            } else {
                print ("Admin: Successfully authenticated with Firebase")
            }
        })
    }
    @IBAction func signInTapped(_ sender: AnyObject) {
        if let email = emailField.text, let pwd = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Admin: Email user authenticated with Firebase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Admin: Unable to authenticate with Firebase using email")
                        } else {
                            print("Admin: Successfully authenticated with Firebase")
                        }
                    })
                }
            })
        }
    }
}

