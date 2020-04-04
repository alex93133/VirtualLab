import UIKit


class NSStringText {
    
    static  func setNSAttributesForHeadLabel(label: UILabel) {
        label.font           = UIFont(name: Fonts.mBold, size: 36)
        let headText         = "Virtual LAB"
        let stringToColor    = "LAB"
        let range            = (headText as NSString).range(of: stringToColor)
        let attribute        = NSMutableAttributedString.init(string: headText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                               value: UIColor(red: 104/255, green: 202/255, blue: 1/255, alpha: 1) , range: range)
        
        label.attributedText = attribute
    }
    
    static func setNSAttributesForHelloLabel(label: UILabel) {
        label.font           = UIFont(name: Fonts.sFLight, size: 20)
        let headText         = "Добро пожаловать, в лабораторию дополненной реальности\nЧтобы ознакомиться подробнее, выберите\nДемонстрационный режим"
        let stringToColor    = "Демонстрационный режим"
        let range            = (headText as NSString).range(of: stringToColor)
        let attribute        = NSMutableAttributedString.init(string: headText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                               value: UIColor(red: 104/255, green: 202/255, blue: 1/255, alpha: 1) , range: range)
        
        label.attributedText = attribute
    }
    
    static func setNSAttributesForTheory(textView: UITextView) {
        let attributedStringParagraphStyle              = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment        = NSTextAlignment.left
        attributedStringParagraphStyle.lineSpacing      = 4.0
        attributedStringParagraphStyle.paragraphSpacing = 15.0

        let attributedStringParagraphStyleOne              = NSMutableParagraphStyle()
        attributedStringParagraphStyleOne.alignment        = NSTextAlignment.left
        attributedStringParagraphStyleOne.lineSpacing      = 4.0
        attributedStringParagraphStyleOne.paragraphSpacing = 5.0

        let attributedStringParagraphStyleTwo              = NSMutableParagraphStyle()
        attributedStringParagraphStyleTwo.alignment        = NSTextAlignment.left
        attributedStringParagraphStyleTwo.lineSpacing      = 4.0
        attributedStringParagraphStyleTwo.paragraphSpacing = 15.0

        let attributedString = NSMutableAttributedString(string: FirstWork.theory)

        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(0,14))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(14,4203))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyle, range:NSMakeRange(0,2696))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleOne, range:NSMakeRange(2696,451))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleTwo, range:NSMakeRange(3147,1070))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.black, range:NSMakeRange(0,4217))
            attributedString.addAttribute(NSAttributedString.Key.backgroundColor, value:UIColor(named: "BackgroundColor")!, range:NSMakeRange(0,4217))

        textView.attributedText = attributedString
        textView.textColor      = UIColor(named: "BlackTextColor")
        textView.sizeToFit()
    }
}
