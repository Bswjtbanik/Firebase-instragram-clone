//
//  SignupVC.swift
//  Firebase instragram clone
//
//  Created by Muhaimin Habib on 3/30/17.
//  Copyright © 2017 Biswajit banik. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupVC: UIViewController {

    @IBOutlet weak var usernametext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func signUpAction(_ sender: Any) {
   
        if usernametext.text != "" && passwordtext.text != "" {
        
            FIRAuth.auth()?.createUser(withEmail: usernametext.text!, password: passwordtext.text!, completion: {(user , error) in
            
                if error != nil
                {
                       let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    
                       let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.cancel, handler: nil)
                
                      alert.addAction(ok)
                      self.present(alert, animated: true, completion: nil)
                }
                else{
                    
                    
                    
                    UserDefaults.standard.set(user!.email, forKey: "usersigned")
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    delegate.rememberlogin()

                    
                   self.performSegue(withIdentifier: "totablebarsegue", sender: nil)
                }
            
            })
        
        }else
        {
        
        
        
        
        }
        

        
     
    }

    @IBAction func lognAction(_ sender: Any) {
    
        
        if usernametext.text != "" && passwordtext.text != ""{
        
            FIRAuth.auth()?.createUser(withEmail: usernametext.text!, password: passwordtext.text!, completion: {(user ,error) in
            
                if (error != nil)
                {
                  //print(error?.localizedDescription)
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.cancel, handler: nil)
                    
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                    
                }else {
                   
                    UserDefaults.standard.set(user!.email, forKey: "usersigned")
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    delegate.rememberlogin()
                
                }
            
            })
        
            
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Provide  an email and a password", preferredStyle: UIAlertControllerStyle.alert)
            
            let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.cancel, handler: nil)
            
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    
    
    
    }
}
