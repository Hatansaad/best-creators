//
//  ProfileViewController.swift
//  تساؤل
//
//  Created by Hatan Dera on 19/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController , HoModelDelegate{

    
    @IBOutlet var ProView: UIView!
    
    
    @IBOutlet weak var FirstN: UILabel!
    
    @IBOutlet weak var BIOP: UILabel!
    @IBOutlet weak var Pic: UIImageView!
    
    var feedItems: NSArray = NSArray()
    var selectedP: Profile = Profile()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        let hoModel = HoModel()
        hoModel.delegate = self
        hoModel.downloadItems()
        
        
        
        
        // Do any additional setup after loading the view.
        //let Pro = ProfileInfoViewController()
        /*
        let ProIte:Profile = Profile()
      
        
      //  let item: Profile = feedItems[indexPath.row] as! Profile
        
        //Pro.ProImage!.text  = ProIte.Image
       // let ProIte: Profile = feedItems[0] as! Profile
        FirstN!.text = ProIte.Fname
        BIOP!.text = ProIte.Bio
        
            for item in  feedItems {
         print("Found \(item)")
         }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        
        
        
        
        //let ProIte:Profile = Profile()
        
        
        //  let item: Profile = feedItems[indexPath.row] as! Profile
        
        //Pro.ProImage!.text  = ProIte.Image
        let ProIte: Profile = feedItems[0] as! Profile
        FirstN!.text = ProIte.Fname
        BIOP!.text = ProIte.Bio
        
        //var img = base64Convert(ProIte.Image) as! UIImage
        
        //Pic!.image = ProIte.Image
        //print(ProIte)
        
        
     /*    for item in  feedItems {
         print("Found \(item)")
         }*/
    }
    
    func base64Convert(base64String: String?) -> UIImage{
        /*if (base64String?.isEmpty)! {
            return #imageLiteral(resourceName: "no_image_found")
        }else {*/
            // !!! Separation part is optional, depends on your Base64String !!!
            let temp = base64String?.components(separatedBy: ",")
            let dataDecoded : Data = Data(base64Encoded: temp![1], options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            return decodedimage!
        }
    
 
    
    
    

}
