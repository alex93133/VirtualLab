import UIKit
import Firebase
import SkeletonView


class AdminPanelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var reverseButton: UIBarButtonItem!
    
    
    var ref: DatabaseReference!
    
    var users = [Users]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
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
                let test            = userDict?["test"] as! String
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
    
    private func setupView() {
        self.tableView.tableFooterView    = UIView()
        self.tableView.estimatedRowHeight = 90
        reverseButton.image               = UIImage(named: "AZ")
    }
    
    
    private func sortData (_ index: UISegmentedControl) {
        switch index.selectedSegmentIndex {
        case 0:
            users.sort {$0.secondName < $1.secondName}
            Design.fadeReloadData(tableView)
            reverseButton.image = UIImage(named: "AZ")
        case 1:
            users.sort {$0.groupNumber < $1.groupNumber}
            Design.fadeReloadData(tableView)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! StudentCustomTableViewCell
        
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


extension AdminPanelViewController: SkeletonTableViewDataSource {
    public func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "Cell"
    }
}




