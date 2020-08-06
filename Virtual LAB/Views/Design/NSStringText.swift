import UIKit


class NSStringText {
    
    static  func setNSAttributesForHeadLabel(label: UILabel) {
        label.font           = UIFont(name: Fonts.mBold, size: 36)
        let headText         = "Virtual LAB"
        let stringToColor    = "LAB"
        let range            = (headText as NSString).range(of: stringToColor)
        let attribute        = NSMutableAttributedString.init(string: headText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                               value: UIColor(named: "Green")! , range: range)
        label.attributedText = attribute
    }
    
    static func setNSAttributesForHelloLabel(label: UILabel) {
        label.font           = UIFont(name: Fonts.sFLight, size: 20)
        let headText         = "Добро пожаловать, в лабораторию дополненной реальности\nЧтобы ознакомиться подробнее, выберите\nДемонстрационный режим"
        let stringToColor    = "Демонстрационный режим"
        let range            = (headText as NSString).range(of: stringToColor)
        let attribute        = NSMutableAttributedString.init(string: headText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                               value: UIColor(named: "Green")! , range: range)
        label.attributedText = attribute
    }
    
    static func getNSForColumnAssembly(textView: UITextView) {
        let attributedStringParagraphStyle                 = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment           = NSTextAlignment.left
        attributedStringParagraphStyle.lineSpacing         = 4.0
        attributedStringParagraphStyle.paragraphSpacing    = 15.0
        
        let attributedStringParagraphStyleOne              = NSMutableParagraphStyle()
        attributedStringParagraphStyleOne.alignment        = NSTextAlignment.left
        attributedStringParagraphStyleOne.lineSpacing      = 4.0
        attributedStringParagraphStyleOne.paragraphSpacing = 5.0
        
        let attributedStringParagraphStyleTwo              = NSMutableParagraphStyle()
        attributedStringParagraphStyleTwo.alignment        = NSTextAlignment.left
        attributedStringParagraphStyleTwo.lineSpacing      = 4.0
        attributedStringParagraphStyleTwo.paragraphSpacing = 15.0
        
        var theoryText = ""
        ThemeManager.shared.getData { (data) in
            theoryText = data.theory
        }
        
        let attributedString = NSMutableAttributedString(string: theoryText)
        
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(0,14))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(14,4203))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyle, range:NSMakeRange(0,2696))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleOne, range:NSMakeRange(2696,451))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleTwo, range:NSMakeRange(3147,1070))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.black, range:NSMakeRange(0,4217))
        
        textView.attributedText = attributedString
        textView.textColor      = UIColor(named: "BlackTextColor")
        textView.sizeToFit()
    }
    
    static func getNSForHeatExchanger(textView: UITextView) {
        let attributedStringParagraphStyle                      = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment                = NSTextAlignment.left
        attributedStringParagraphStyle.firstLineHeadIndent      = 35.4
        attributedStringParagraphStyle.tailIndent               = 484.45
        attributedStringParagraphStyle.lineSpacing              = 4.5
        attributedStringParagraphStyle.paragraphSpacing         = 5.0
        
        let attributedStringParagraphStyleOne                   = NSMutableParagraphStyle()
        attributedStringParagraphStyleOne.alignment             = NSTextAlignment.left
        attributedStringParagraphStyleOne.firstLineHeadIndent   = 35.4
        attributedStringParagraphStyleOne.tailIndent            = 484.45
        attributedStringParagraphStyleOne.lineSpacing           = 4.5
        attributedStringParagraphStyleOne.paragraphSpacing      = 5.0
        
        let attributedStringParagraphStyleTwo                   = NSMutableParagraphStyle()
        attributedStringParagraphStyleTwo.alignment             = NSTextAlignment.left
        attributedStringParagraphStyleTwo.firstLineHeadIndent   = 35.4
        attributedStringParagraphStyleTwo.tailIndent            = 484.45
        attributedStringParagraphStyleTwo.lineSpacing           = 4.5
        attributedStringParagraphStyleTwo.paragraphSpacing      = 5.0
        
        let attributedStringParagraphStyleThree                 = NSMutableParagraphStyle()
        attributedStringParagraphStyleThree.alignment           = NSTextAlignment.left
        attributedStringParagraphStyleThree.firstLineHeadIndent = 35.4
        attributedStringParagraphStyleThree.tailIndent          = 484.45
        attributedStringParagraphStyleThree.lineSpacing         = 4.5
        attributedStringParagraphStyleThree.paragraphSpacing    = 5.0
        
        var theoryText = ""
        ThemeManager.shared.getData { (data) in
            theoryText = data.theory
        }
        
        let attributedString                                    =  NSMutableAttributedString(string: theoryText)
        
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(0,964))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(964,43))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(1008,351))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(1359,49))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(1409,404))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(1813,39))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(1853,262))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(2115,44))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(2160,605))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(2765,33))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(2799,391))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(3190,25))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(3216,358))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(3574,38))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(3613,831))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(4444,15))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(4459,504))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(4965,18))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(4983,626))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(5609,15))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(5624,1312))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.mBold, size:17.0)!, range:NSMakeRange(6936,2))
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name: Fonts.sFRegular, size:17.0)!, range:NSMakeRange(6938,1592))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyle, range:NSMakeRange(0,86))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleOne, range:NSMakeRange(86,58))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleTwo, range:NSMakeRange(144,170))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleThree, range:NSMakeRange(314,8216))
        
        textView.attributedText = attributedString
        textView.textColor      = UIColor(named: "BlackTextColor")
        textView.sizeToFit()
    }
}
