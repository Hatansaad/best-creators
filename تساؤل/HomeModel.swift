//
//  HomeModel.swift
//  تساؤل
//
//  Created by Hatan Dera on 07/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit
protocol HomeModelDelegate {
    func itemsDownloaded(items:NSArray)
}
class HomeModel: NSObject , URLSessionDataDelegate{

    var delegate: HomeModelDelegate!
    // Hit the web service URL
     let urlPath = "http://tsawul.com/QuestionTableView.php"
    
    func downloadItems(){
        
        // Download the JSON data
        let url: URL = URL(string: urlPath)!
        // create session
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        //start task
        //let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
        
       
        
    }
    
    func parseJSON(_ data:Data){
        
        var jsonResult = NSArray()

        do{
            // Parse the data into json object
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)}
        
        var jsonElement = NSDictionary()
        let questions = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let question = Question()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let Question_Details = jsonElement["Question_Details"] as? String ,
                let title = jsonElement["Title"] as? String,
                 let Fname = jsonElement["Fname"] as? String,
                let Lname = jsonElement["Lname"] as? String,
                let Cat_name = jsonElement["Cat_name"] as? String
            
            {
                
               
                question.Question_Details = Question_Details
                question.title = title
                question.Fname = Fname
                question.Lname = Lname
                question.Cat_name = Cat_name
               
            }
            
            questions.add(question)
           
           
        }
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: questions)
            
        })
       
        
        
        
    }
    
    
}
