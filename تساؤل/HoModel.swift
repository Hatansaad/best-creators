//
//  HoModel.swift
//  تساؤل
//
//  Created by HESSA on 3/4/18.
//  Copyright © 2018 Tsaul developers. All rights reserved.
//
import Foundation

protocol HoModelDelegate {
    func itemsDownloaded(items:NSArray)
}
class HoModel: NSObject , URLSessionDataDelegate{
    
    var delegate: HoModelDelegate!
    // Hit the web service URL
    let urlPath = "http://tsawul.com/ReU.php"
    
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
        let profiles = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let profile = Profile()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let Email = jsonElement["Email"] as? String,
                let Fname = jsonElement["Fname"] as? String,
                let Lname = jsonElement["Lname"] as? String,
                let Password = jsonElement["Password"] as? String,
                let Bio = jsonElement["Bio"] as? String,
            let Image = jsonElement["Image"] as? String
                
            {
                
                profile.Email = Email
                profile.Fname = Fname
                profile.Lname = Lname
                profile.Password = Password
                profile.Bio = Bio
                 profile.Image = Image
                
                
            }
            
            profiles.add(profile)
            
            
        }
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: profiles)
            
        })
        
        
        
        
    }
    
    
}

