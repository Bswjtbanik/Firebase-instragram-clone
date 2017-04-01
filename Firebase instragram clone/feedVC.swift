//
//  FirstViewController.swift
//  Firebase instragram clone
//
//  Created by Muhaimin Habib on 3/30/17.
//  Copyright © 2017 Biswajit banik. All rights reserved.
//

import UIKit

class feedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    @IBAction func logOutACTION(_ sender: Any) {
   
      UserDefaults.standard.removeObject(forKey: "usersigned")
      UserDefaults.standard.synchronize()
        
      let signIn = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        
      let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
      delegate.window?.rootViewController = signIn
        
      delegate.rememberlogin()
        
}

}
