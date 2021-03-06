//
//  ViewController.swift
//  Twitter
//
//  Created by Ziyang Tan on 10/6/14.
//  Copyright (c) 2014 Ziyang Tan. All rights reserved.
//

import UIKit

let kLoginSegue = "loginSegue"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, error: NSError?) in
            if user != nil {
                // perform segue
                self.performSegueWithIdentifier(kLoginSegue, sender: self)
            } else {
                //handle login error
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == kLoginSegue) {
            let homeNav = segue.destinationViewController as UINavigationController
            let containerViewController = ContainerViewController()
            homeNav.viewControllers[0] = containerViewController
            homeNav.setNavigationBarHidden(true, animated: false)
        }
    }

}

