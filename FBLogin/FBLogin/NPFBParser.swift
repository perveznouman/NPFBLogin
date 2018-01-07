//
//  FBParser.swift
//  FBLogin
//
//  Created by NOUMAN PERVEZ on 04/01/18.
//  Copyright © 2018 NOUMAN PERVEZ. All rights reserved.
//

import UIKit

class NPFBParser: NSObject {
    
   public var emailID : String!
   public var name : String!
   public var LName : String!
   public var FName : String!
   public var fbID : String!
   public var otherDetails : NSDictionary!
    
    
    init (_ responseObj: NSDictionary){
        
        super.init()
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
        return
    }
}
