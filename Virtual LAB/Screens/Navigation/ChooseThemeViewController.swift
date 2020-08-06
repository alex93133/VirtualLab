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
        let radioButtons = RadioButtons(buttons: nameOfThemeButtons)
        radioButtons.applyEffect(sender)
    }
    
    @IBAction func enterToRead(_ sender: Any) {
        for button in nameOfThemeButtons {
            if button.isSelected == true {
                ThemeManager.shared.currentThemeID = button.tag
                performSegue(withIdentifier: Segues.reading, sender: nil)
            }
        }
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        FirebaseManager.shared.signOut { [weak self]  in
            self?.dismiss(animated: true, completion: nil)
        }
    }
}
