//
//  LoginVC.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

   
    @IBAction func loginPressed(sender: AnyObject) {
        
        if let email = emailField.text, let pass = passwordField.text where (email.characters.count > 0 && pass.characters.count > 0) {
            
            // calls from Services/AuthService Singleton
            
            AuthService.instance.login(email, password: pass, onComplete: { (errMsg, data) in
               
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "Error Authenticating", message: errMsg, preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    return
                }
                
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            
            
        } else {
            
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both a username and password", preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            presentViewController(alert, animated: true, completion: nil)
            
            
        }
    }

   

    
    
    
    
}





