//
//  Login.swift
//  nutrition-app
//
//  Created by Tian Shiyu on 11/3/20.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toSignup"){
            let controller = segue.destination as! SignupViewController
            if emailText.text != nil {
                controller.defaultEmail = emailText.text!
            }
            controller.delegate = self
        }
    }
    @IBAction func loginBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "tomain", sender: self)
//        if let email = emailText.text, let password = passwordText.text {
//            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                if let e = error {
//                    print(e)
//                } else {
//                    self.performSegue(withIdentifier: "toquestion", sender: self)
//                }
//            }
//        }
        
    }
}

extension LoginViewController:SendInfoDelegate{
    
    func sendInfo(email: String, password:String) {
        emailText.text = email
        passwordText.text = password
    }
}
