//
//  registerViewController.swift
//  تساؤل
//
//  Created by Bashayer on 28/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Fname: UITextField!
    @IBOutlet weak var Lname: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var bio: UITextView!
    @IBAction func regbutton(_ sender: Any) {
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
