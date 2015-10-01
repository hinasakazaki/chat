//
//  LoginViewController.swift
//  chat
//
//  Created by Hina Sakazaki on 9/30/15.
//  Copyright © 2015 Hina Sakazaki. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUpAction(sender: AnyObject) {
        var user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
        user.email = emailTextField.text
        
        user.signUpInBackgroundWithBlock{
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                print("Signup Failed")
                print(errorString)
            } else {
                print("Signed up!")
                self.performSegueWithIdentifier("loginToChat", sender: nil)
            }
        }
    }
    @IBAction func signInAction(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(emailTextField.text!, password: passwordTextField.text!){
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("Logged In!")
                self.performSegueWithIdentifier("loginToChat", sender: nil)
            } else {
                print("Login Failed")
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
