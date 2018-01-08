//
//  ViewController.swift
//  FBLogin
//
//  Created by NOUMAN PERVEZ on 03/01/18.
//  Copyright © 2018 NOUMAN PERVEZ. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKLoginKit

class NPFBLoginViewController: UIViewController, FBParserDelegate {

 // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UIAction
    @IBAction func Action_FBLogin(_ sender: UIButton) {
        
        let fbParse = NPFBParser()
        print(fbParse)
        fbParse.delegate = self
    }
    
    // MARK: NPFBParser Delegate
    func parsingCompleted(_ obj: NPFBParser) {
        
        print(obj)
    }
    
}

