import UIKit
import Firebase
import SkeletonView


class AdminPanelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var reverseButton: UIBarButtonItem!
    
    
    var ref = FirebaseManager.shared.ref
    var users = [Users]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.showAnimatedGradientSkeleton(animation: Design.skeletonAnimation, transition: .crossDissolve(0.5))
        FirebaseManager.shared.getUsers { [weak self] (users) in
            self?.users = users
            self?.tableView.hideSkeleton()
            self?.sortData((self?.sortingSegmentedControl)!)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ref.removeAllObservers()
    }
    
    private func setupView() {
        tableView.tableFooterView    = UIView()
        tableView.estimatedRowHeight = 90
        reverseButton.image          = UIImage(named: "AZ")
    }
    
    private func sortData (_ index: UISegmentedControl) {
        switch index.selectedSegmentIndex {
        case 0:
            users.sort {$0.secondName < $1.secondName}
            Design.smoothUpdateTableViewData(tableView)
            reverseButton.image = UIImage(named: "AZ")
        case 1:
            users.sort {$0.groupNumber < $1.groupNumber}
            Design.smoothUpdateTableViewData(tableView)
            reverseButton.image = UIImage(named: "AZ")
        default:
            return
        }
    }
    
    private func updateReverseButtonImage() {
        if reverseButton.image == UIImage(named: "AZ") {
            reverseButton.image = UIImage(named: "ZA")
        } else {
            reverseButton.image = UIImage(named: "AZ")
        }
    }
    
    
    @IBAction func sorting(_ sender: UISegmentedControl) {
        sortData(sender)
    }
    
    @IBAction func reverseButtonPressed(_ sender: UIBarButtonItem) {
        updateReverseButtonImage()
        users.reverse()
        tableView.reloadData()
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        FirebaseManager.shared.signOut { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
}







