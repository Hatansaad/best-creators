//
//  Register.swift
//  تساؤل
//
//  Created by Hatan Dera on 20/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class Register: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldFname: UITextField!
    @IBOutlet weak var textFieldLname: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    let URL_SAVE_USER = "http://tsawul.com/register2.php";
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        let requestURL = NSURL(string:URL_SAVE_USER)
        let request = NSMutableURLRequest(url: requestURL! as URL)
        request.httpMethod = "POST"
        let Email = textFieldEmail.text
        let Fname = textFieldFname.text
        let Lname = textFieldLname.text
        let pass = textFieldPass.text
        let Bio = "nil"
        let Image = "nil"
        
        let postParameters = "Email="+Email!+"&Fname="+Fname!+"&Lname="+Lname!+"&Password="+pass!+"&Bio="+Bio+"Image="+Image;
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        let url: URL = URL(string: URL_SAVE_USER)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
       //let task = URLSession.shared.dataTask(with: URL_SAVE_USER){ (data, response, error) in
       let task = defaultSession.dataTask(with: url) { (data, response, error) in
       // let task = URLSession.shared.dataTask(With: request ){
           
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            
            
            do{
                let  myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)as? NSDictionary
                if let parseJSON = myJSON {
                    
                    var msg : String!
                    msg = parseJSON["message"] as! String?
                    print(msg)
                }
            }catch{
                print(error)
            }
            
            
            
            
        }
        
        task.resume()
        
        
        
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
