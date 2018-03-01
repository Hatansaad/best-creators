//
//  TableViewCell.swift
//  تساؤل
//
//  Created by Hatan Dera on 07/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var QProfileImg: UIImageView!
    
    @IBOutlet weak var QUsername: UILabel!
    
    @IBOutlet weak var QTitle: UILabel!
    
    @IBOutlet weak var QDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
