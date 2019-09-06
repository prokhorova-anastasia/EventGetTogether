//
//  EventTableViewCell.swift
//  EventGetTogether
//
//  Created by N on 01/09/2019.
//  Copyright © 2019 N. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var starEventLabel: UILabel!
    @IBOutlet weak var nameEventLabel: UILabel!
    @IBOutlet weak var nameAndPhoneAuthorLabel: UILabel!
    @IBOutlet weak var eventCellView: UIView!
    
    @IBOutlet weak var statusImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        eventCellView?.clipsToBounds = true
        eventCellView!.layer.cornerRadius = 6
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
