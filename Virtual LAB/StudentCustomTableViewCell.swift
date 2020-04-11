import UIKit


class StudentCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var groupNumberLabel: UILabel!
    @IBOutlet weak var columnTestLabel: UILabel!
    @IBOutlet weak var columnWorkDidFinished: UIButton!
    @IBOutlet weak var exchangerTestLabel: UILabel!
    @IBOutlet weak var exchangerWorkDidFinished: UIButton!
    
    
    func workResult (user: Users) {
        if user.work1DidFinished{
            columnWorkDidFinished.isSelected = true
        } else {
            columnWorkDidFinished.isSelected = false
        }
        if user.work2DidFinished {
            exchangerWorkDidFinished.isSelected = true
        } else {
            exchangerWorkDidFinished.isSelected = false
        }
    }
}
