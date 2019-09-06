
import UIKit

class FilterHallTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filterCellView: UIView!
    @IBOutlet weak var checkBoxFilterButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        filterCellView?.clipsToBounds = true
        filterCellView!.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
