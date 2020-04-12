import UIKit
import Firebase

class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet var placeholderDescription: [UILabel]!
    @IBOutlet var inputTextFields: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headLabel.font              = UIFont(name: "Montserrat-ExtraBold", size: 36)
        errorLabel.isHidden         = true
        loginButton.backgroundColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 0.12)
        self.view.backgroundColor   = UIColor(named: "BackgroundColor")
        
        Attributing.setPlaceholderDescriptionFont(placeholderDescription)
        Attributing.setAttributeForTextFields(inputTextFields)
        
    }
    
    var handle : AuthStateDidChangeListenerHandle!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            guard user != nil else { return }
            if user?.uid == "Ecueo44ulOR9ORTLNfGGjhxBLwL2" {
                self.performSegue(withIdentifier: "fromAuthToAdminPanel", sender: nil)
                print(user?.uid as Any)
            } else {
                self.performSegue(withIdentifier: "fromAuthToTheory", sender: nil)
                print(user?.uid as Any)
            }
        }
        
        emailTextField.text    = ""
        passwordTextField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    
    func  displayWarningLabel(withText: String) {
        errorLabel.isHidden = false
        errorLabel.text = withText
    }
    
    
    func segueChoosing() {
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            switch uid {
            case "Ecueo44ulOR9ORTLNfGGjhxBLwL2":
                performSegue(withIdentifier: "fromAuthToAdminPanel", sender: nil)
                print(uid)
            default:
                performSegue(withIdentifier: "fromAuthToTheory", sender: nil)
                print(uid)
            }
        }
    }
    
    
    //MARK: Actions
    
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        
        displayWarningLabel(withText: "")
        var resultMessage = ""
        guard let email  = emailTextField.text, email != "" else {
            displayWarningLabel(withText: "Поля не должны быть пустыми"); return }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            DispatchQueue.main.async {
                
                if error != nil  {
                    resultMessage = FirebaseErrorsProcessing.showError(error: error!.localizedDescription)
                } else {
                    resultMessage = "Мы отправили инструкцию по восстановлению пароля на адрес \n \(email)"
                }
                
                let alert = UIAlertController(title: "Восстановление пароля", message: resultMessage, preferredStyle: .alert)
                let closeAlert = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
                
                alert.addAction(closeAlert)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        displayWarningLabel(withText: "")
        
        guard let email  = emailTextField.text,
            let password = passwordTextField.text,
            email    != "",
            password != ""
            else {
                displayWarningLabel(withText: "Поля не должны быть пустыми")
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] (user, error) in
            if error != nil {
                self?.displayWarningLabel(withText: FirebaseErrorsProcessing.showError(error: error!.localizedDescription))
                return
            }
            
            guard user != nil else { return }
            
        })
        segueChoosing()
    }
    
}


