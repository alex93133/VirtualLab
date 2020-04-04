import UIKit

class Design {
    
//    Smooth reload data in TableView
    static func fadeReloadData(_ tableView: UITableView) {
        UIView.transition(with: tableView, duration: 0.2, options: .transitionCrossDissolve, animations: {tableView.reloadData()}, completion: nil)
    }
    
    
    static func setStageTitle (_ title : String) -> UILabel {
        let label       = UILabel()
        label.textColor = UIColor(red: 104/255, green: 202/255, blue: 1/255, alpha: 1)
        label.text      = title
        return label
    }
    
    
    static func setPlaceholderDescriptionFont (_ arrayOfLabel : [UILabel]) {
        for label in arrayOfLabel {
            label.font = UIFont(name: Fonts.sFLight, size: 14)
            
        }
    }
    
    
    static func setAttributeForTextFields (_ arrayOfTextFields : [UITextField]) {
        for textField in arrayOfTextFields {
            textField.font               = UIFont(name: Fonts.sFRegular, size: 17)
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
