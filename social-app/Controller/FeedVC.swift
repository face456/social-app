//
//  FeedVC.swift
//  social-app
//
//  Created by Philipp Jahn on 15.09.17.
//  Copyright © 2017 Rollin Donkey. All rights reserved.
//
//  Copyright © icons8.com for all used icons
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func signInTapped(_ sender: AnyObject) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print ("Admin: ID removed from keychain \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
}
