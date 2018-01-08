//
//  FBParser.swift
//  FBLogin
//
//  Created by NOUMAN PERVEZ on 04/01/18.
//  Copyright © 2018 NOUMAN PERVEZ. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKLoginKit

protocol NPFBParserDelegate: class {
    
    func parsingCompleted(_ obj: NPFBParser) -> Void
}

class NPFBParser: NSObject {
    
   public var emailID : String!
   public var name : String!
   public var LName : String!
   public var FName : String!
   public var fbID : String!
   public var otherDetails : NSDictionary!
   public weak var delegate : NPFBParserDelegate?


    // MARK: Init
    override init() {
        
        super.init()
        self.getPermissionFromFB()
        return
    }
    
    // MARK: User Defined Method

    func getPermissionFromFB() -> Void {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: NPFBLoginViewController() ) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email")){
                    self.getFBUserData()
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    guard let resultDict = result else{
                        return
                    }
                    let responseDict = resultDict as? NSDictionary
                    self.parseFBData(responseDict!)
                }
            })
        }
    }
    
    func parseFBData(_ responseObj: NSDictionary) -> Void {
        
        if let email = responseObj["email"]{
            self.emailID = email as! String
        }
        else{
            self.emailID = ""
        }
        if let name = responseObj["name"]{
            self.name = name as! String
        }
        else{
            self.name = ""
        }
        if let fName = responseObj["first_name"]{
            self.FName = fName as! String
        }
        else{
            self.FName = ""
        }
        if let lName = responseObj["last_name"]{
            self.LName = lName as! String
        }
        else{
            self.LName = ""
        }
        if let fbID = responseObj["id"]{
            self.fbID = fbID as! String
        }
        else{
            self.fbID = ""
        }
        if let picture = responseObj["picture"]{
            self.otherDetails = picture as! NSDictionary
        }
        else{
            self.otherDetails = [:]
        }
        //calls delegate and sends backs to Viewcontroller
        self.delegate?.parsingCompleted(self)
    }
}
