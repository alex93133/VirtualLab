import UIKit
import Firebase

class AdminPanel: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    var users = [Users]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
    }
    
    //MARK: Read Data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.alpha = 0
        self.ref = Database.database().reference()
        self.ref.child("Users").observe(.value, with: {(snapshot) in

            for snap in snapshot.children {
                let userSnap        = snap as! DataSnapshot
                let userDict        = userSnap.value as? [String:AnyObject]
                let email           = userDict?["email"] as! String
                let firstName       = userDict?["firstName"] as! String
                let secondName      = userDict?["secondName"] as! String
                let groupNumber     = userDict?["groupNumber"] as! String
                let test            = userDict?["test"] as? String ?? "Работа не начата"
                let workDidFinished = userDict?["workDidFinished"] as? Bool ?? false
                let user            = Users(firstName: firstName, secondName: secondName, email: email, groupNumber: groupNumber, test: test, workDidFinished: workDidFinished)
                
                self.users.append(user)
            }
            
            UIView.animate(withDuration: 0.2) {
                self.tableView.reloadData()
                self.tableView.alpha = 1
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           self.ref.removeAllObservers()
       }
    
    
    //MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomTableViewCell
        cell?.textLabel?.text = self.users[indexPath.row].firstName
        cell?.backgroundColor = UIColor(named: "BackgroundColor")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "LOL"
    }
    //MARK: Actions
    
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
}






