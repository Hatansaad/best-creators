//
//  Profile.swift
//  تساؤل
//
//  Created by HESSA on 3/4/18.
//  Copyright © 2018 Tsaul developers. All rights reserved.
//



import Foundation

class Profile: NSObject {
    
    //properties
    
    var Email: String?
    var Fname: String?
    var Lname: String?
    var Password: String?
    var Bio: String?
     var Image: String?

    
    
    //empty constructor
    
     override init()
    {
        
    }
    
    //construct with parameters
    
    init(Email: String, Fname: String, Lname: String, Password: String, Bio: String, Image: String)
{
        
        self.Email = Email
        self.Fname = Fname
        self.Lname = Lname
        self.Password = Password
        self.Bio = Bio
        self.Image = Image

    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Email: \(Email), Fname: \(Fname), Lname: \(Lname), Password: \(Password) , Bio: \(Bio), Image: \(Image)"
    }
    
    
    
}
