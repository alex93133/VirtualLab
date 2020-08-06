import UIKit
import SkeletonView


class Design {
    
    static func navBarIsTransparent(transparent: Bool) {
        let color = transparent ? UIColor.clear : UIColor(named: "BackgroundColor")!
        UINavigationBar.appearance().backgroundColor = color
    }
    
    static let skeletonAnimation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)
    
    static func smoothUpdateTableViewData(_ tableView: UITableView) {
        UIView.transition(with: tableView, duration: 0.2, options: .transitionCrossDissolve, animations: {tableView.reloadData()}, completion: nil)
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
    
    static func setButtonTextAlignment(buttons: [UIButton]) {
        for button in buttons {
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            button.imageEdgeInsets            = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            button.titleEdgeInsets            = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        }
    }
    
    static func disableMultiTouchForButton (buttonsArray : [UIButton]) {
        for button in buttonsArray {
            button.isExclusiveTouch = true
        }
    }
}
