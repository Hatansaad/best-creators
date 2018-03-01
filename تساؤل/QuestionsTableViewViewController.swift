//
//  QuestionsTableViewViewController.swift
//  تساؤل
//
//  Created by Hatan Dera on 07/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class QuestionsTableViewViewController: UIViewController ,  HomeModelDelegate  {

    var homeModel = HomeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // initiate callint the items download
        homeModel.getItems()
        homeModel.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded(questions: [Question]) {
        
    }


}
