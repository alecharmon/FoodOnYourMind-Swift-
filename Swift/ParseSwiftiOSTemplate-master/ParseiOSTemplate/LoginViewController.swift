//
//  LoginViewController.swift
//  FoodOnYourMind(Swift)
//
//  Created by alec on 7/15/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

 
    @IBOutlet weak var username: UITextField!
  
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: AnyObject) {
        
        var userEmailAddress = username.text.lowercaseString

        var userPassword = password.text
        
        
        switch userEmailAddress.rangeOfString("@"){
            case nil :
                //username
                println("login with Username")
                PFUser.logInWithUsernameInBackground(userEmailAddress, password:userPassword) {
                    (user: PFUser?, error: NSError?) -> Void in
                    if user != nil {
                        dispatch_async(dispatch_get_main_queue()) {
                            //self.performSegueWithIdentifier("signInToNavigation", sender: self)
                            println(user)
                        }
                    } else {
                        if let message: AnyObject = error!.userInfo!["error"] {
                            let alertController = UIAlertController(title: nil, message:
                                "There was a problem Loging, Please Check Your username and password", preferredStyle: UIAlertControllerStyle.Alert)
                            //alert actions
                            let ok: UIAlertAction = UIAlertAction(title: "Ok", style: .Default) {action -> Void in
                                
                            }
                            alertController.addAction(ok)
                            self.presentViewController(alertController, animated: true, completion: nil)
                            
                        }
                    }
                }
            default:
                //login with email
                println("login with email")
                PFUser.logInWithUsernameInBackground(userEmailAddress, password:userPassword) {
                    (user: PFUser?, error: NSError?) -> Void in
                    if user != nil {
                        dispatch_async(dispatch_get_main_queue()) {
                            //self.performSegueWithIdentifier("signInToNavigation", sender: self)
                            println(user)
                            
                        }
                    } else {
                        
                        if let message: AnyObject = error!.userInfo!["error"] {
                            let alertController = UIAlertController(title: nil, message:
                                "There was a problem Loging, Please Check Your username and password", preferredStyle: UIAlertControllerStyle.Alert)
                            
                            //alert actions
                            
                            let ok: UIAlertAction = UIAlertAction(title: "Ok", style: .Default) {action -> Void in
                                
                            }
                            alertController.addAction(ok)
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
            }
            
        }
        
        
        

    }
    @IBAction func goBack(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("WViewController") as! UIViewController
        self.presentViewController(vc, animated: false, completion: nil)
    }
//@IBOutlet weak var loginUser: UIButton!
//    @IBAction func login(sender: AnyObject) {
////     
////        
////        var userEmailAddress = username.text.lowercaseString
////        
////        var userPassword = password.text
////        
////        PFUser.logInWithUsernameInBackground(userEmailAddress, password:userPassword) {
////            (user: PFUser?, error: NSError?) -> Void in
////            if user != nil {
////                dispatch_async(dispatch_get_main_queue()) {
////                    //self.performSegueWithIdentifier("signInToNavigation", sender: self)
////                     println(user)
////                    
////                }
////            } else {
////                
////                if let message: AnyObject = error!.userInfo!["error"] {
////                    println("\(message)")
////                }
////            }
////        }
//    }
    
  //  @IBAction func goBack(sender: AnyObject) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("WViewController") as! UIViewController
//        self.presentViewController(vc, animated: false, completion: nil)
   // }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
