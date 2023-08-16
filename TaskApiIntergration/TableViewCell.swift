//
//  TableViewCell.swift
//  TaskApiIntergration
//
//  Created by Ananth Nair on 09/08/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var img1: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
