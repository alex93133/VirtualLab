import UIKit

class CustomTableViewCell: UITableViewCell {

     @IBOutlet weak var nameLabel: UILabel!
     @IBOutlet weak var groupLabel: UILabel!
     @IBOutlet weak var testLabel: UILabel!
     @IBOutlet weak var workResultLabel: UIButton!
    
    func workResult (user: Users) {
        if user.workDidFinished {
            workResultLabel.isSelected = true
        } else {
            workResultLabel.isSelected = false
        }
    }
    
    
}
