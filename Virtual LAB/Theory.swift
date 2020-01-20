import UIKit
import Firebase

class Theory: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var nameOfWorkLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headLabel.font            = UIFont(name: "Montserrat-ExtraBold", size: 36)
        nameOfWorkLabel.font      = UIFont(name: "Montserrat-Bold", size: 20)
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
    }
    
    
    //MARK: Actions
    
    
    @IBAction func enterToRead(_ sender: Any) {
        
        performSegue(withIdentifier: "toReading", sender: nil)
        
    }
    
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
  
}
