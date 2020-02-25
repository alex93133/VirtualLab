import UIKit


extension Authorization {
   
    
    func setupView() {
        headLabel.font              = UIFont(name: "Montserrat-ExtraBold", size: 36)
            errorLabel.isHidden         = true
            loginButton.backgroundColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 0.12)
            self.view.backgroundColor   = UIColor(named: "BackgroundColor")
            
            Attributing.setPlaceholderDescriptionFont(placeholderDescription)
            Attributing.setAttributeForTextFields(inputTextFields)
    }
}
