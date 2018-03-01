//
//  ViewController.swift
//  تساؤل
//
//  Created by Hatan Dera on 12/05/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate{
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    let array:[String] = ["technology" , "science" , "general" , "business" , "medical"] // for images
    //let category =  ["التكنلوجيا”,”العلوم”,”معلومات عامة”,”إدارة الاعمال”,”5”]  // for label
    let category = ["Technology" , "Science" , "General" , "Business" ,"Medical"]
   
    
    @IBOutlet weak var logoAnimation: NSLayoutConstraint!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor=UIColor.white//background color white
        //button1.layer.cornerRadius=button1.frame.height/2//round button
        //button2.layer.cornerRadius=button2.frame.height/2//round button
        //button3.layer.cornerRadius=button3.frame.height/2//round button
        
   //  logoAnimation.constant -= view.bounds.width
        
        collectionview.dataSource = self;
        collectionview.delegate = self;
        var layout = self.collectionview.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(30, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionview.frame.size.width - 20)/2, height: self.collectionview.frame.size.height/3)
        
        
        

}
    
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
       // self.logoAnimation.constant += self.view.bounds.width
        //self.view.layoutIfNeeded()
    }, completion: nil)
    
    //self.performSegue(withIdentifier: "homeView", sender: self);
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        
        cell.myImageView.image = UIImage(named:array[indexPath.row] + ".png")
        cell.myLabel.text = category[indexPath.item]
        
        //styling the cell
        cell.contentView.layer.cornerRadius = 20.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        
         cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
 
        return cell
    }
   
}

