

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
