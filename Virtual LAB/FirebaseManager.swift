import UIKit
import Firebase


class FirebaseManager {
    
    static  let shared = FirebaseManager()
    
    private init() {}
    
    
    var handle : AuthStateDidChangeListenerHandle!
    var ref: DatabaseReference = Database.database().reference()
    let adminUID               = ["Ecueo44ulOR9ORTLNfGGjhxBLwL2"]
    let errorDictionary        = ["The email address is badly formatted.":"Неверный формат данных", "There is no user record corresponding to this identifier. The user may have been deleted.":"Пользователь не зарегистрирован", "Network error (such as timeout, interrupted connection or unreachable host) has occurred.":"Проверьте подключение к интернету", "The password is invalid or the user does not have a password.":"Неверный пароль"]
    
    
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
            print(groupNumber)
            let userInfo    = Users(firstName: firstName, secondName: secondName, email: email, groupNumber: groupNumber, works: nil)
            print(userInfo.groupNumber)
            let userInfoRef = self.ref.child("Users").child((user?.user.uid)!)
            userInfoRef.setValue(userInfo.convertToDictionary())
            let workInfo = [Work(id: 1), Work(id: 2)]
            let work1InfoRef = self.ref.child("Users").child((user?.user.uid)!).child("works").child("work1")
            work1InfoRef.setValue(workInfo[0].convertToDictionary())
            let work2InfoRef = self.ref.child("Users").child((user?.user.uid)!).child("works").child("work2")
            work2InfoRef.setValue(workInfo[1].convertToDictionary())
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
                
                let email           = userDict?["email"] as! String
                let firstName       = userDict?["firstName"] as! String
                let secondName      = userDict?["secondName"] as! String
                let groupNumber     = userDict?["groupNumber"] as! String
                
                var works = [Work]()
                for workNumber in 1...2 {
                    let workDict = userDict?["works"]?["work\(workNumber)"] as! [String : Any]
                    let id = workDict["id"] as! Int
                    let test = workDict["test"] as! String
                    let workDidFinished = workDict["workDidFinished"] as! Bool
                    var work = Work(id: id)
                    work.test = test
                    work.workDidFinished = workDidFinished
                    works.append(work)
                }
                
                let user = Users(firstName: firstName,
                                 secondName: secondName,
                                 email: email,
                                 groupNumber: groupNumber,
                                 works: works)
                users.append(user)
            }
            handler(users)
        })
    }
    
    func updateWorkInfo() {
        guard let userID = getCurrentUserUid() else { return }
        let userInfoRef = ref.child("Users").child(userID).child("works").child("work\(ThemeManager.shared.currentThemeID)")
        userInfoRef.updateChildValues(["workDidFinished": true])
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

