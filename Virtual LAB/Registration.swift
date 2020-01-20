import UIKit
import Firebase

class Registration: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBOutlet var placeholderDescription: [UILabel]!
    @IBOutlet var inputTextFields: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
        headLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 36)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: Attributing.setStageTitle("Этап 1 из 2"))
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        Attributing.setPlaceholderDescriptionFont(placeholderDescription)
        Attributing.setAttributeForTextFields(inputTextFields)
        
    }
    
    
    let placeholderNames = ["E-mail", "Пароль", "Пароль еще раз"]
    
    
    func  displayWarningLabel(withText: String) {
        errorLabel.isHidden = false
        errorLabel.text     = withText
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dvc   = segue.destination as? CompleteRegistration else { return }
        guard let email = emailTextField.text else { return }
        dvc.email = email
    }
    
    
    //MARK: Actions
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        displayWarningLabel(withText: "")
        
        guard let email  = emailTextField.text,
            let password = passwordTextField.text,
            email    != "",
            password != ""
            else {
                displayWarningLabel(withText: "Поля не должны быть пустыми")
                return
        }
        
        guard password == repeatPasswordTextField.text else {
            displayWarningLabel(withText: "Пароли должны совпадать")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
            
            guard error == nil || user != nil else { self?.displayWarningLabel(withText: "Произошла ошибка"); return }
        }
        performSegue(withIdentifier: "completeReg", sender: nil)
    }
    
    
}













