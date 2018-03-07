//
//  ProfileViewController.swift
//  تساؤل
//
//  Created by Hatan Dera on 19/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController , HoModelDelegate{

    
    
    var feedItems: NSArray = NSArray()
    var selectedP: Profile = Profile()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        let hoModel = HoModel()
        hoModel.delegate = self
        hoModel.downloadItems()
        
        
        
        
        
        // Do any additional setup after loading the view.
        let Pro = ProfileInfoViewController()
        let ProIte:Profile = Profile()
        
      //  let item: Profile = feedItems[indexPath.row] as! Profile
        
        //Pro.ProImage!.text  = ProIte.Image
        Pro.proName!.text = ProIte.Fname
        Pro.ProBio!.text = ProIte.Bio
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        
        
        /* for item in  feedItems {
         print("Found \(item)")
         }*/
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // Get the question to be shown

    
    
    
    
    

}
