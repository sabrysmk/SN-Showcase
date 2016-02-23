//
//  ViewController.swift
//  SN-Showcase
//
//  Created by Александр Сабри on 23/02/16.
//  Copyright © 2016 Александр Сабри. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func fbBtnPressed(sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult:FBSDKLoginManagerLoginResult!, facebookError: NSError!)->
            Void in
            
            if facebookError != nil{
                print("Facebok login failed. Error \(facebookError)")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfuly logged in facebook. \(accessToken) ")
            }
        
        
        }
        
            
    }

}

