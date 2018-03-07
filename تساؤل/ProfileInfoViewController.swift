//
//  ProfileInfoViewController.swift
//  تساؤل
//
//  Created by Hatan Dera on 19/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class ProfileInfoViewController: UIViewController {

    @IBOutlet weak var ProImage: UIImageView!
    
    @IBOutlet weak var proName: UILabel!
    
    @IBOutlet weak var ProBio: UILabel!
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
