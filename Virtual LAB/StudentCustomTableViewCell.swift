import UIKit

class StudentCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
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
