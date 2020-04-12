import UIKit
import Firebase

class CompleteRegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var groupNumberTextField: UITextField!
    
    @IBOutlet var inputTextFields: [UITextField]!
    @IBOutlet var placeholderDescription: [UILabel]!
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: Attributing.setStageTitle("Этап 2 из 2"))
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        errorLabel.isHidden = true
        headLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 36)
        
        ref = Database.database().reference()
        
        Attributing.setPlaceholderDescriptionFont(placeholderDescription)
        Attributing.setAttributeForTextFields(inputTextFields)
        
    }
    
    
    let placeholderNames = ["Имя", "Фамилия", "Номер группы"]
    
    var ref: DatabaseReference!
    
    var email: String!
    
    
    func  displayWarningLabel(withText: String) {
        errorLabel.isHidden = false
        errorLabel.text     = withText
    }
    
    
    //MARK: Actions
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        displayWarningLabel(withText: "")
        
        guard let groupNumber = groupNumberTextField.text,
            let firstName     = firstNameTextField.text,
            let secondName    = secondNameTextField.text,
            groupNumber != "",
            firstName   != "",
            secondName  != ""
            else {
                displayWarningLabel(withText: "Поля не должны быть пустыми")
                return
        }
        
        
        guard let userID = Auth.auth().currentUser?.uid else {
            displayWarningLabel(withText: "Пользователь не создан")
            return }
        let userInfo    = Users(firstName: firstName, secondName: secondName, email: email, groupNumber: groupNumber, test: "Не выполнен", workDidFinished: false)
        let userInfoRef = self.ref.child("Users").child(userID)
        userInfoRef.setValue(userInfo.convertToDictionary())
        
        performSegue(withIdentifier: "fromRegToTheory", sender: nil)
    }
    
}
