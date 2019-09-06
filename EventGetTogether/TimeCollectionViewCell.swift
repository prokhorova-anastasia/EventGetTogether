//
//  TimeCollectionViewCell.swift
//  EventGetTogether
//
//  Created by N on 05/09/2019.
//  Copyright © 2019 N. All rights reserved.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timeCellView?.clipsToBounds = true
        timeCellView!.layer.cornerRadius = 6
        
        // Initialization code
    }

}
