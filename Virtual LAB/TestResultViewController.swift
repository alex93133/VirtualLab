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
    
    private func showCustomAlert() {
        let allertMessage = "Лабораторная работа находится в раработке, предлагаем Вам пройти её демо версию"
               AlertControllerManager.presentAllert(title: "Внимание!", message: allertMessage, closeButton: "Вперед!", targetVC: self) { _ in
                   self.performSegue(withIdentifier: Segues.aRDemo, sender: nil)
               }
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
       showCustomAlert()
    }
}
