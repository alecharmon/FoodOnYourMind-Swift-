//
//  WelcomeViewController.swift
//  FoodOnYourMind(Swift)
//
//  Created by alec on 7/15/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

import UIKit
import CoreData
class WelcomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
     
        }
        
        
    override func viewDidLayoutSubviews() {
        if(checkIfLoggedin()){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("MainNavigation") as! UIViewController
            self.presentViewController(vc, animated: true, completion: nil)

        }
        else{
            clearUsers()
        }
        
    }
    
    func checkIfLoggedin()->Bool{
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            // Do stuff with the user
        } else {
            // Show the signup or login screen
        }

        
        return false
    }
    
    func clearUsers(){

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
