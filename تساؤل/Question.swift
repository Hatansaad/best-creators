//
//  Question.swift
//  تساؤل
//
//  Created by Hatan Dera on 13/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class Question: NSObject {

    //properties
    
    var Question_ID: String?
    var Question_Details: String?
    var title: String?
    var REmail: String?
    var Cat_ID: String?

    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(Question_ID: String, Question_Details: String, title: String, REmail: String, Cat_ID: String) {
        
        self.Question_ID = Question_ID
        self.Question_Details = Question_Details
        self.title = title
        self.REmail = REmail
        self.Cat_ID = Cat_ID
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Question_ID: \(Question_ID), Question_Details: \(Question_Details), title: \(title), REmail: \(REmail) , Cat_ID: \(Cat_ID)"
        
    }
    
    
    
}
