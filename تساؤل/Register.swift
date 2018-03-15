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
    @IBOutlet weak var BioText: UITextView!
    @IBOutlet weak var ProfileImage: UIImageView!
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        
       
        let Email = textFieldEmail.text
        let Fname = textFieldFname.text
        let Lname = textFieldLname.text
        let pass = textFieldPass.text
        let Bio = BioText.text
       // let Image =
        
       
        
        
        
        
        
        
        
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
