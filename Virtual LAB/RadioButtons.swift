import UIKit

class RadioButtons {
    
    let firstAnswerButton:  UIButton!
    let secondAnswerButton: UIButton!
    let thirdAnswerButton:  UIButton
    
    init(firstAnswerButton: UIButton, secondAnswerButton: UIButton, thirdAnswerButton: UIButton) {
        self.firstAnswerButton  = firstAnswerButton
        self.secondAnswerButton = secondAnswerButton
        self.thirdAnswerButton  = thirdAnswerButton
    }
    
    
    static func taggingOfButtons (buttonsArray : [UIButton]) {
        var tagForButton = 1
        for button in buttonsArray {
            button.tag = tagForButton
            tagForButton += 1
        }
    }
    
    // This func provides fade-in and fade-out when button did pressed
    static func changeCheckBox (_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    // This func is final RadioButton func for use
    func answerButtonPressed(_ sender: UIButton) {
        RadioButtons.changeCheckBox(sender)
        
        switch sender.tag {
        case 1:
            secondAnswerButton.isSelected = false
            thirdAnswerButton.isSelected  = false
        case 2:
            firstAnswerButton.isSelected = false
            thirdAnswerButton.isSelected = false
        case 3:
            firstAnswerButton.isSelected  = false
            secondAnswerButton.isSelected = false
        default: print(sender.tag)
        }
        
    }
    
    
}
