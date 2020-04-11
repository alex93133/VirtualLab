import UIKit
import Firebase


class FirebaseManager {
    
    static  let shared = FirebaseManager()
    var handle : AuthStateDidChangeListenerHandle!
    var ref: DatabaseReference = Database.database().reference()
    let adminUID               = ["Ecueo44ulOR9ORTLNfGGjhxBLwL2"]
    let errorDictionary        = ["The email address is badly formatted.":"Неверный формат данных", "There is no user record corresponding to this identifier. The user may have been deleted.":"Пользователь не зарегистрирован", "Network error (such as timeout, interrupted connection or unreachable host) has occurred.":"Проверьте подключение к интернету", "The password is invalid or the user does not have a password.":"Неверный пароль"]
    
    
    private init() {}
    
    
    func forgotPassword(email: String, targetVC: UIViewController) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            DispatchQueue.main.async {
                let resultMessage: String
                
                if error != nil  {
                    resultMessage = self.errorDictionary[error!.localizedDescription] ?? error!.localizedDescription
                } else {
                    resultMessage = "Мы отправили инструкцию по восстановлению пароля на адрес \n \(email)"
                }
                AlertControllerManager.presentAlert(title: "Восстановление пароля", message: resultMessage, targetVC: targetVC, handler: nil)
            }
        }
    }
    
    func signIn(email: String, password: String, targetVC: UIViewController, handler: @escaping (String?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                let printedError = self.errorDictionary[error!.localizedDescription] ?? error!.localizedDescription
                handler(printedError)
                return
            }
            guard user != nil else { return }
        })
    }
    
    func signOut(handler: @escaping ()->() ) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        handler()
    }
    
    func register(email: String, password: String, firstName: String, secondName: String, groupNumber: String, handler: @escaping (String?) -> () ) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil || user != nil else {
                handler(error?.localizedDescription)
                return
            }
            let userInfo    = Users(firstName: firstName,
                                    secondName: secondName,
                                    email: email,
                                    groupNumber: groupNumber,
                                    work1Test: "Не выполнен",
                                    work2Test: "Не выполнен",
                                    work1DidFinished: false,
                                    work2DidFinished: false)
            let userInfoRef = self.ref.child("Users").child((user?.user.uid)!)
            userInfoRef.setValue(userInfo.convertToDictionary())
            handler(nil)
        }
    }
    
    func getCurrentUserUid() -> String? {
        let user = Auth.auth().currentUser
        if let user = user {
            return user.uid
        }
        return nil
    }
    
    func getUsers(handler: @escaping ([Users]) -> ()) {
        var users = [Users]()
        ref = Database.database().reference()
        ref.child("Users").observe(.value, with: {(snapshot) in
            for snap in snapshot.children {
                let userSnap        = snap as! DataSnapshot
                let userDict        = userSnap.value as? [String:AnyObject]
                
                let email                    = userDict?["email"] as! String
                let firstName                = userDict?["firstName"] as! String
                let secondName               = userDict?["secondName"] as! String
                let groupNumber              = userDict?["groupNumber"] as! String
                let work1Test               = userDict?["work1Test"] as! String
                let work2Test            = userDict?["work2Test"] as! String
                let work1DidFinished    = userDict?["work1DidFinished"] as! Bool
                let work2DidFinished = userDict?["work2DidFinished"] as! Bool
                
                let user = Users(firstName: firstName,
                                 secondName: secondName,
                                 email: email,
                                 groupNumber: groupNumber,
                                 work1Test: work1Test,
                                 work2Test: work2Test,
                                 work1DidFinished: work1DidFinished,
                                 work2DidFinished: work2DidFinished)
                users.append(user)
            }
            handler(users)
        })
    }
    
    func updateWorkInfo() {
        guard let userID = getCurrentUserUid() else { return }
        let userInfoRef = ref.child("Users").child(userID)
        userInfoRef.updateChildValues(["work\(ThemeManager.shared.currentThemeID)DidFinished": true])
    }
    
    func addListener(handler: @escaping (String?) -> ()) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            guard user != nil else { return }
            handler(user?.uid)
        }
    }
    
    func removeListener() {
        Auth.auth().removeStateDidChangeListener(handle)
    }
}

