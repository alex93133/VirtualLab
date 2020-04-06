import UIKit

class TestResultViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var congratulationLabel: UILabel!
    @IBOutlet weak var numberOfRightAnswersLabel: UILabel!
    @IBOutlet weak var textRightAnswersLabel: UILabel!
    
    
    var message: String!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        headLabel.font                 = UIFont(name: Fonts.mBold, size: 36)
        congratulationLabel.font       = UIFont(name: Fonts.sFLight, size: 20)
        numberOfRightAnswersLabel.font = UIFont(name: Fonts.mBold, size: 64)
        textRightAnswersLabel.font     = UIFont(name: Fonts.sFLight, size: 20)
        numberOfRightAnswersLabel.text = message
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        switch ThemeManager.shared.currentThemeID {
        case 1:
            performSegue(withIdentifier: Segues.aRWork1, sender: nil)
        case 2:
            performSegue(withIdentifier: Segues.aRWork2, sender: nil)
        default:
            return
        }
    }
}
