//
//  TableViewController.swift
//  تساؤل
//
//  Created by Hatan Dera on 07/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class TableViewController:  UITableViewController ,HomeModelDelegate {
    
    var feedItems: NSArray = NSArray()
    var selectedQuestion: Question = Question()
    @IBOutlet var QTableView: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        //set self as the tableview's data source and delegate
        self.QTableView.delegate = self
        self.QTableView.dataSource = self
    
        
        // initiate callint the items download
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.QTableView.reloadData()
        
       /* for item in  feedItems {
            print("Found \(item)")
        }*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //MARK: - UITableView Delegat Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return feedItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: TableViewCell = QTableView.dequeueReusableCell(withIdentifier: cellIdentifier)! as! TableViewCell
        // Get the question to be shown
        let item: Question = feedItems[indexPath.row] as! Question
        // Get references to labels of cell
   
        myCell.QTitle!.text = item.title
        myCell.QUsername!.text  = item.Fname 
        myCell.QDetails!.text  = item.Question_Details
        
        
       
        
        return myCell;
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "ViewAnswersControllerTableViewController") as! ViewAnswersControllerTableViewController
        let item1: Question = feedItems[indexPath.row] as! Question
        
       
        DvC.getUserName = item1.Fname as! String
        DvC.getTitle = item1.title as! String
        DvC.getDetails = item1.Question_Details as! String
        
        
        
        self.navigationController?.pushViewController(DvC, animated: true)
        */
        
        
        selectedQuestion = feedItems[indexPath.row] as! Question
       performSegue(withIdentifier: "MasterToDetail", sender: selectedQuestion)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // copy selected question from user and pass it through the segue
        
        
        
        if segue.identifier == "MasterToDetail" {
             let receiverVC = segue.destination as! ViewAnswersControllerTableViewController
             receiverVC.question = sender as? Question
            
            
        }
    }
    

}







