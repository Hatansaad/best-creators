//
//  TableViewController.swift
//  تساؤل
//
//  Created by Hatan Dera on 07/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController , HomeModelDelegate {
    
    var feedItems: NSArray = NSArray()
    var selectedQuestion: Question = Question()
    @IBOutlet var QTableView: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        //set self as the tableview's data source and delegate
      //  self.QTableView.delegate = self
       // self.QTableView.dataSource = self
    
        
        // initiate callint the items download
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.QTableView.reloadData()
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

    //MARK: - UITableView Delegat Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return feedItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: TableViewCell = QTableView.dequeueReusableCell(withIdentifier: cellIdentifier)! as! TableViewCell
        // Get the location to be shown
        let item: Question = feedItems[indexPath.row] as! Question
        // Get references to labels of cell
        print("red")
        myCell.QTitle!.text = item.title
        myCell.QUsername!.text  = item.REmail
        myCell.QDetails!.text  = item.Question_Details
        
        
       /* let cell = QTableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath) as! TableViewCell
        cell.QTitle.text = questions[indexPath.row].title
        cell.QUsername.text = questions[indexPath.row].REmail
        cell.QDetails.text = questions[indexPath.row].Question_Details */
        
        return myCell;
    }
    
  

}
