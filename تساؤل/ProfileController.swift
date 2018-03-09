//
//  ProfileController.swift
//  تساؤل
//
//  Created by HESSA on 3/9/18.
//  Copyright © 2018 Tsaul developers. All rights reserved.
//

    
    import UIKit
    
    class ProfileController: UIViewController {
        
        @IBOutlet weak var FisrtName: UILabel!
        
        @IBOutlet weak var BioLabel: UILabel!
        // let URL_GET_TEAMS:String = "http://192.168.43.207/MyWebService/api/getteams.php"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
            //created NSURL
            let URL_GET_USER = "http://tsawul.com/RegUser.php";
            
            
            
            let requestURL = NSURL(string: URL_GET_USER)
            
            
            //creating NSMutableURLRequest
            let request = NSMutableURLRequest(url: requestURL! as URL)
            
            //setting the method to post
            request.httpMethod = "GET"
            let ProIte:Profile = Profile()
            
            //  let item: Profile = feedItems[indexPath.row] as! Profile
            
            //Pro.ProImage!.text  = ProIte.Image
            FisrtName!.text = ProIte.Fname
            BioLabel!.text = ProIte.Bio
            
            
            
            //creating a task to send the post request
            let url: URL = URL(string: URL_GET_USER)!
            let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
            //let task = URLSession.shared.dataTask(with: URL_SAVE_USER){ (data, response, error) in
            let task = defaultSession.dataTask(with: url) { (data, response, error) in
                
                
                //exiting if there is some error
                if error != nil{
                    print("error is \(error)")
                    return;
                }}
            task.resume()}
                
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
                        
                        let profiles = Profile()
                        
                        //the following insures none of the JsonElement values are nil through optional binding
                        if //let Email = jsonElement["Email"] as? String ,
                            let FName = jsonElement["Fname"] as? String,
                           // let LName = jsonElement["Lname"] as? String,
                           //  let Password = jsonElement["Password"] as? String,
                            let Bio = jsonElement["Bio"] as? String
                            
                        {
                        //displaying the data
                       // print("Email -> ", Email)
                        print("FName -> ", FName)
                       // print("LName -> ", LName)
                       // print("Password -> ", Password)
                        print("Bio -> ", Bio)
                      //  print("===================")
                        print("")
                        
                    }
                    
               
            }
            //executing the task
   
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    }
