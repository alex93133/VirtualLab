import UIKit
import Firebase

class ChooseThemeViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    
    @IBOutlet var nameOfThemeButtons: [UIButton]!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headLabel.font            = UIFont(name: "Montserrat-ExtraBold", size: 36)
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        RadioButtons.taggingOfButtons(buttonsArray: nameOfThemeButtons)
        nextButton.isEnabled = false
        nextButton.alpha = 0.3
        Attributing.setButtonTextAligment(butttons: nameOfThemeButtons)
        Attributing.disableMultiTouchForButton(buttonsArray: nameOfThemeButtons)
    }
    
    
    //MARK: Actions
    
    
    @IBAction func themeButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
        if  sender.isSelected != true {
            self.nextButton.isEnabled = true
            self.nextButton.alpha = 1
            } else {
            self.nextButton.isEnabled = false
            self.nextButton.alpha = 0.3
            }
        }
        
        let radioButtonInstance = RadioButtons(firstAnswerButton: nameOfThemeButtons[0],
                                               secondAnswerButton: nameOfThemeButtons[1],
                                               thirdAnswerButton: nameOfThemeButtons[2])
        radioButtonInstance.answerButtonPressed(sender)
    }
    
    @IBAction func enterToRead(_ sender: Any) {
        
        for button in nameOfThemeButtons {
            if button.isSelected == true {
                switch button.tag {
                case 1:
                    performSegue(withIdentifier: "toReading", sender: nil)
                case 2, 3:
                    let alert = UIAlertController(title: "Внимание!", message: "Даннный раздел находится в разработке", preferredStyle: .alert)
                    let closeAlert = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
                    alert.addAction(closeAlert)
                    self.present(alert, animated: true, completion: nil)
                default:
                    print("Something is going wrong")
                }
            }
        }
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}
