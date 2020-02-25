import Foundation
import Firebase


extension Authorization {
    
    
    func segueChoosing(_ uid: String) {
        switch uid {
        case "Ecueo44ulOR9ORTLNfGGjhxBLwL2":
            performSegue(withIdentifier: "fromAuthToAdminPanel", sender: nil)
        default:
            performSegue(withIdentifier: "fromAuthToTheory", sender: nil)
        }
    }
    
    func segueAfterLogin() {
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            self.segueChoosing(uid)
        }
        
    }
    
    func segueListener() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
               guard user != nil else { return }
            self.segueChoosing(user!.uid)
           }
    }

}
