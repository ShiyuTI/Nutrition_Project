//
//  Signup.swift
//  nutrition-app
//
//  Created by Tian Shiyu on 11/3/20.
//

import Foundation
import UIKit
import Firebase

public protocol SendInfoDelegate{
    func sendInfo(email: String, password:String)
}

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var defaultEmail:String?
    var delegate : SendInfoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if defaultEmail != nil {
            emailTextfield.text = defaultEmail
        }
    }

    @IBAction func registerBtn(_ sender: Any) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    if((self.delegate) != nil){
                        self.delegate?.sendInfo(email: email, password: password)
                    }
                    self.presentingViewController!.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    
}
