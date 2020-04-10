import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet var placeholderDescription: [UILabel]!
    @IBOutlet var inputTextFields: [UITextField]!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    let secondStageNames = ["Имя", "Фамилия", "Номер группы"]
    
    var userInfo = (email: "", password: "", firstName: "", secondName: "", groupNumber: "")
    
    private func setupView() {
        errorLabel.isHidden = true
        headLabel.font = UIFont(name: Fonts.mBold, size: 36)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: Design.setStageTitle("Этап 1 из 2"))
        Design.setPlaceholderDescriptionFont(placeholderDescription)
        Design.setAttributeForTextFields(inputTextFields)
    }
    
    private func updateView() {
        nextButton.setTitle("Завершить", for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: Design.setStageTitle("Этап 2 из 2"))
        for index in 0...2 {
            let label = placeholderDescription[index]
            label.text = secondStageNames[index]
            let textField = inputTextFields[index]
            textField.text = ""
            textField.isSecureTextEntry = false
        }
        thirdTextField.autocapitalizationType = .allCharacters
    }
    
    private func  displayWarningLabel(withText: String) {
        errorLabel.isHidden = false
        errorLabel.text     = withText
    }
    
    private func fieldIsNotEmpty() -> Bool {
        guard firstTextField.text != "",
            secondTextField.text != "",
            thirdTextField.text != ""
            else {
                displayWarningLabel(withText: "Поля не должны быть пустыми")
                return false
        }
        return true
    }
    
    private func firstStageOfReg() throws {
        guard let email  = firstTextField.text,
            let password = secondTextField.text,
            email    != "",
            password != ""
            else {
                displayWarningLabel(withText: "Поля не должны быть пустыми")
                throw ErrorHandling.emptyFields
        }
        guard password == thirdTextField.text else {
            displayWarningLabel(withText: "Пароли должны совпадать")
            throw ErrorHandling.passwordAreNotSimilar
        }
        userInfo.email    = email
        userInfo.password = password
    }
    
    private func secondStageOfReg() throws {
        guard
            let firstName   = firstTextField.text,
            let secondName  = secondTextField.text,
            let groupNumber = thirdTextField.text,
            groupNumber != "",
            firstName   != "",
            secondName  != ""
            else {
                throw ErrorHandling.emptyFields
        }
        userInfo.firstName   = firstName
        userInfo.secondName  = secondName
        userInfo.groupNumber = groupNumber
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        displayWarningLabel(withText: "")
        if nextButton.titleLabel?.text == "Далее" {
            do {
                try firstStageOfReg()
            } catch let error {
                displayWarningLabel(withText: error.localizedDescription)
                return
            }
            updateView()
        } else {
            do {
                try secondStageOfReg()
            } catch let error {
                displayWarningLabel(withText: error.localizedDescription)
                return
            }
            FirebaseManager.shared.register(email: userInfo.email,
                                            password: userInfo.password,
                                            firstName: userInfo.firstName,
                                            secondName: userInfo.secondName,
                                            groupNumber: userInfo.groupNumber) { [weak self] (error) in
                                                if let error = error {
                                                    self?.displayWarningLabel(withText: error)
                                                    return
                                                } else {
                                                    DispatchQueue.main.async {
                                                        self?.performSegue(withIdentifier: Segues.chooseThemeFromReg, sender: nil)
                                                    }
                                                }
            }
        }
    }
}













