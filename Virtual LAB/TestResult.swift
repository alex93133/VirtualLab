import UIKit

class TestResult: UIViewController {

    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var congratulationLabel: UILabel!
    @IBOutlet weak var numberOfRightAnswersLabel: UILabel!
    @IBOutlet weak var textRightAnswersLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(message)
        
        headLabel.font                 = UIFont(name: "Montserrat-ExtraBold", size: 36)
        congratulationLabel.font       = UIFont(name: "SFProDisplay-Light", size: 20)
        numberOfRightAnswersLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 64)
        textRightAnswersLabel.font     = UIFont(name: "SFProDisplay-Light", size: 20)
        numberOfRightAnswersLabel.text = message
        self.view.backgroundColor      = UIColor(named: "BackgroundColor")
        
    }

    
   var message: String!
   
    
    func rouiting() {
        performSegue(withIdentifier: "fromTestResultToARDemo", sender: nil)
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let allertMessage = "Лабораторная работа находится в раработке, предлагаем Вам пройти её демо версию"
        let alert = UIAlertController(title: "Внимание!", message: allertMessage, preferredStyle: .alert)
        let closeAlert = UIAlertAction(title: "Вперед!", style: .default) { (closeAlert) in
            self.rouiting()
        }
        
        alert.addAction(closeAlert)
        self.present(alert, animated: true, completion: nil)
        
    }
}
