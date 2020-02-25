import UIKit
import Firebase

class Authorization: UIViewController, UITextFieldDelegate {
    
    
    //MARK: Outlets
    
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet var placeholderDescription: [UILabel]!
    @IBOutlet var inputTextFields: [UITextField]!
    
    
    //MARK: Properties
    
    
    var handle : AuthStateDidChangeListenerHandle!
    let email    = ""
    let password = ""
    
    
    //MARK: VC life cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        segueListener()
        
        emailTextField.text    = ""
        passwordTextField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    
    //MARK: Functions
    
    
    func  displayWarningLabel(withText: String) {
        errorLabel.isHidden = false
        errorLabel.text = withText
    }
    
    func checkingForEmptyFields() {
        guard self.email  == emailTextField.text,
            self.password == passwordTextField.text,
            email    != "",
            password != ""
            else {
                displayWarningLabel(withText: "Поля не должны быть пустыми")
                return
        }
    }
    
    func presentAllert(text: String) {
        let alert = UIAlertController(title: "Восстановление пароля", message: text, preferredStyle: .alert)
        let closeAlert = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        
        alert.addAction(closeAlert)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: Actions
    
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        displayWarningLabel(withText: "")
        checkingForEmptyFields()
        passwordSendReset()
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        displayWarningLabel(withText: "")
        checkingForEmptyFields()
        signIn()
        segueAfterLogin()
    }
    
}


