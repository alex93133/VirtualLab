import UIKit

class RadioButtons {
    
    var buttons: [UIButton]
    
    
    init(buttons: [UIButton]) {
        self.buttons = buttons
    }
    
    // This func provides fade-in and fade-out when button did pressed
    static func changeCheckBox (_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    static func taggingOfButtons (buttonsArray : [UIButton]) {
        var tagForButton = 1
        for button in buttonsArray {
            button.tag = tagForButton
            tagForButton += 1
        }
    }
    
    // This func is final RadioButton func for use
    func applyEffect(_ sender: UIButton) {
        let updatedButtons: [UIButton] = buttons.map() { $0.isSelected = false
            return $0
        }
        buttons = updatedButtons
        RadioButtons.changeCheckBox(sender)
    }
}
