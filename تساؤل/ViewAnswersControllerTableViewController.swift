//
//  ViewAnswersControllerTableViewController.swift
//  تساؤل
//
//  Created by Hatan Dera on 23/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class ViewAnswersControllerTableViewController: UITableViewController {

    var getUserName = String()
    var getTitle = String()
    var getDetails = String()
    
  
    var question: Question?
    
    @IBOutlet weak var QCell: DetailedQuestionCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        QCell.userName.text! = (question?.Fname)!
        QCell.title.text! = (question?.title)!
        QCell.content.text! = (question?.Question_Details)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
 

    
}
