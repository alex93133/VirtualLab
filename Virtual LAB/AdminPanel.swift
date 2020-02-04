import UIKit
import Firebase
import SkeletonView

class AdminPanel: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    
    var users = [Users]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        self.tableView.estimatedRowHeight = 100
        self.view.isSkeletonable = true
        self.view.showAnimatedGradientSkeleton()
        
    }
    
    //MARK: Read Data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

       
        
        self.ref = Database.database().reference()
        self.ref.child("Users").queryOrdered(byChild: "secondName").observe(.value, with: {(snapshot) in
            self.users.removeAll()
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
                self.view.hideSkeleton()
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
        cell?.firstNameLabel.text = users[indexPath.row].firstName
        cell?.secondNameLabel.text = users[indexPath.row].secondName
        cell?.groupLabel.text = users[indexPath.row].groupNumber
        cell?.testLabel.text = users[indexPath.row].test
        cell?.workResult(user: users[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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

extension AdminPanel: SkeletonTableViewDataSource {
    
    public func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "Cell"
    }
    
}




