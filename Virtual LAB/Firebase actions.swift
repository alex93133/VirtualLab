import Firebase
import Foundation


extension Authorization {
    
    func signIn() {
        Auth.auth().signIn(withEmail: self.email, password: self.password, completion: { [weak self] (user, error) in
               if error != nil {
                   self?.displayWarningLabel(withText: FirebaseErrorsProcessing.showError(error: error!.localizedDescription))
                   return
               }
               guard user != nil else { return }
           })
    }
    
    func passwordSendReset() {
        var resultMessage = ""
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                DispatchQueue.main.async {
                    if error != nil  {
                        resultMessage = FirebaseErrorsProcessing.showError(error: error!.localizedDescription)
                    } else {
                        resultMessage = "Мы отправили инструкцию по восстановлению пароля на адрес \n \(self.email)"
                    }
                    self.presentAllert(text: resultMessage)
                }
            }
    }
    
    
}
