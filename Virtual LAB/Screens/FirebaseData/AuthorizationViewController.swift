import UIKit
import Firebase


class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var placeholderDescription: [UILabel]!
    @IBOutlet var inputTextFields: [UITextField]!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkingForCurrentUser()
        emailTextField.text    = ""
        passwordTextField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        FirebaseManager.shared.removeListener()
    }
    
    private func setupView() {
        headLabel.font      = UIFont(name: Fonts.mBold, size: 36)
        errorLabel.isHidden = true
        Design.setPlaceholderDescriptionFont(placeholderDescription)
        Design.setAttributeForTextFields(inputTextFields)
    }
    
    private func checkingForCurrentUser() {
        FirebaseManager.shared.addListener { [weak self] (uid) in
            guard uid != nil else { return }
            self?.segueChoosing(uid: uid!)
        }
    }
    
    private func  displayWarningLabel(withText: String) {
        errorLabel.isHidden = false
        errorLabel.text = withText
    }
    
    private func segueChoosing(uid: String) {
        if FirebaseManager.shared.adminUID.contains(uid) {
            performSegue(withIdentifier: Segues.admin, sender: nil)
        } else {
            performSegue(withIdentifier: Segues.chooseTheme, sender: nil)
        }
    }
    
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        displayWarningLabel(withText: "")
        guard let email  = emailTextField.text, email != "" else {
            displayWarningLabel(withText: "Поля не должны быть пустыми")
            return
        }
        FirebaseManager.shared.forgotPassword(email: email, targetVC: self)
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        displayWarningLabel(withText: "")
        guard let email  = emailTextField.text,
            let password = passwordTextField.text,
            email    != "",
            password != ""
            else {
                let error = ErrorHandling.emptyFields
                displayWarningLabel(withText: error.localizedDescription)
                return
        }
        FirebaseManager.shared.signIn(email: email, password: password, targetVC: self) { [weak self] (error) in
            self?.displayWarningLabel(withText: error!)
        }
    }
}


