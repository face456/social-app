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
                print ("Phil: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print ("Phil: User cancelled Facebook authentication")
            } else {
                print ("Phil: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Phil: Unable to authenticate with Firebase -\(String(describing: error))")
            } else {
                print ("Phil: Successfully authenticated with Firebase")
            }
        })
    }
}

