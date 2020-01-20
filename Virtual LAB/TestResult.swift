import UIKit

class TestResult: UIViewController {

    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var congratulationLabel: UILabel!
    @IBOutlet weak var numberOfRightAnswersLabel: UILabel!
    @IBOutlet weak var textRightAnswersLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headLabel.font                 = UIFont(name: "Montserrat-ExtraBold", size: 36)
        congratulationLabel.font       = UIFont(name: "SFProDisplay-Light", size: 20)
        numberOfRightAnswersLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 64)
        textRightAnswersLabel.font     = UIFont(name: "SFProDisplay-Light", size: 20)
        numberOfRightAnswersLabel.text = message
        self.view.backgroundColor      = UIColor(named: "BackgroundColor")
        
    }

    
   var message: String!
    
}
