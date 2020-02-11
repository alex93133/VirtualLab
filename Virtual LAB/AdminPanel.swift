import UIKit
import Firebase
import SkeletonView


class AdminPanel: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sortingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var reverseButton: UIBarButtonItem!
    
    
    var ref: DatabaseReference!
    
    var users = [Users]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView    = UIView()
        self.tableView.estimatedRowHeight = 90
        
        reverseButton.image = UIImage(named: "AZ")
    }
    
    
    //MARK: Read Data from Firebase
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)
        self.tableView.showAnimatedGradientSkeleton(animation: animation, transition: .crossDissolve(0.5))
        
        self.ref = Database.database().reference()
        self.ref.child("Users").observe(.value, with: {(snapshot) in
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
            }
            self.tableView.hideSkeleton()
            self.sortData(self.sortingSegmentedControl)
        })
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.ref.removeAllObservers()
    }
    
    
    func sortData (_ index: UISegmentedControl) {
        switch index.selectedSegmentIndex {
        case 0:
            users.sort {$0.secondName < $1.secondName}
            self.tableView.reloadData()
            reverseButton.image = UIImage(named: "AZ")
        case 1:
            users.sort {$0.groupNumber < $1.groupNumber}
            self.tableView.reloadData()
            reverseButton.image = UIImage(named: "AZ")
        default:
            break
        }
    }
    
    func updateReverseButtonImage() {
        if self.reverseButton.image == UIImage(named: "AZ") {
            self.reverseButton.image = UIImage(named: "ZA")
        } else {
            self.reverseButton.image = UIImage(named: "AZ")
        }
    }
    
    
    //MARK: Table View Data Source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        let user = users[indexPath.row]
        
        cell.firstNameLabel.text  = user.firstName
        cell.secondNameLabel.text = user.secondName
        cell.groupLabel.text      = user.groupNumber
        cell.testLabel.text       = user.test
        cell.workResult(user: user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    //MARK: Actions
    
    
    @IBAction func sorting(_ sender: UISegmentedControl) {
        sortData(sender)
    }
    
    @IBAction func reverseButtonPressed(_ sender: UIBarButtonItem) {
        updateReverseButtonImage()
        users.reverse()
        tableView.reloadData()
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


//MARK: Extensions


extension AdminPanel: SkeletonTableViewDataSource {
    public func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "Cell"
    }
}




