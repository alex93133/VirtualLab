import UIKit
import Firebase

class ChooseThemeViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet var nameOfThemeButtons: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        headLabel.font       = UIFont(name: Fonts.mBold, size: 36)
        nextButton.isEnabled = false
        nextButton.alpha     = 0.3
        RadioButtons.taggingOfButtons(buttonsArray: nameOfThemeButtons)
        Design.setButtonTextAlignment(buttons: nameOfThemeButtons)
        Design.disableMultiTouchForButton(buttonsArray: nameOfThemeButtons)
    }
    
    private func showHideNextButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            if  sender.isSelected != true {
                self.nextButton.isEnabled = true
                self.nextButton.alpha     = 1
            } else {
                self.nextButton.isEnabled = false
                self.nextButton.alpha     = 0.3
            }
        }
    }
    
    
    @IBAction func themeButtonPressed(_ sender: UIButton) {
        showHideNextButton(sender)
        
        let radioButtons = RadioButtons(firstAnswerButton: nameOfThemeButtons[0],
                                               secondAnswerButton: nameOfThemeButtons[1],
                                               thirdAnswerButton: nameOfThemeButtons[2])
        radioButtons.applyEffect(sender)
    }
    
    @IBAction func enterToRead(_ sender: Any) {
        
        for button in nameOfThemeButtons {
            if button.isSelected == true {
                ThemeManager.shared.currentThemeID = button.tag
               switch button.tag {
                case 1, 2:
                    performSegue(withIdentifier: Segues.reading, sender: nil)
                case 3:
                     AlertControllerManager.presentAlert(title: "Внимание!", message: "Даннный раздел находится в разработке", targetVC: self, handler: nil)
                default:
                    print("Something is going wrong")
                }
            }
        }
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        FirebaseManager.shared.signOut { [weak self]  in
            self?.dismiss(animated: true, completion: nil)
        }
    }
}
