import UIKit

class Attributing: UIViewController {
    
    
    static  func setNSAttributesForHeadLabel (label: UILabel) {
           
           label.font = UIFont(name: "Montserrat-ExtraBold", size: 36)
           
           let headText      = "Virtual LAB"
           let stringToColor = "LAB"
           
           let range = (headText as NSString).range(of: stringToColor)
           
           let attribute = NSMutableAttributedString.init(string: headText)
           attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                                  value: UIColor(red: 104/255, green: 202/255, blue: 1/255, alpha: 1) , range: range)
           
           label.attributedText = attribute
    }
    
    static func setNSAttributesForHelloLabel (label: UILabel) {
        
        label.font = UIFont(name: "SFProDisplay-Light", size: 20)
        
        let headText      = "Добро пожаловать, в лабораторию дополненной реальности\nЧтобы ознакомиться подробнее, выберите\nДемонстрационный режим"
        let stringToColor = "Демонстрационный режим"
        
        let range = (headText as NSString).range(of: stringToColor)
        
        let attribute = NSMutableAttributedString.init(string: headText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                               value: UIColor(red: 104/255, green: 202/255, blue: 1/255, alpha: 1) , range: range)
        
        label.attributedText = attribute
        
    }
    
    static func setStageTitle (_ title : String) -> UILabel {
        let label       = UILabel()
        label.textColor = UIColor(red: 104/255, green: 202/255, blue: 1/255, alpha: 1)
        label.text      = title
        return label
    }
    
    
    static func setPlaceholderDescriptionFont (_ arrayOfLabel : [UILabel]) {
        for label in arrayOfLabel {
            label.font = UIFont(name: "SFProDisplay-Light", size: 14)
        }
    }
    
    
    static func setAttributeForTextFields (_ arrayOfTextFields : [UITextField]) {
        for textField in arrayOfTextFields {
            textField.font               = UIFont(name: "SFProDisplay-Regular", size: 17)
            textField.textColor          = UIColor(named: "BlackTextColor")
            textField.borderStyle        = .none
            textField.layer.cornerRadius = 10
            textField.clipsToBounds      = true
            textField.setLeftPaddingPoints(16)
            textField.setRightPaddingPoints(16)
            
        }
    }
    
   static func setButtonTextAligment(butttons: [UIButton]) {
        for button in butttons {
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        }
    }
    
    
    static func disableMultiTouchForButton (buttonsArray : [UIButton]) {
        for button in buttonsArray {
         button.isExclusiveTouch = true
        }
    }
    
}


//MARK: Extension for Text Fields


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView   = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView     = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView    = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView     = paddingView
        self.rightViewMode = .always
    }
}
