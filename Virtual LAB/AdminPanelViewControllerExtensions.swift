import UIKit
import SkeletonView


//MARK: TableView DataSource, Delegate
extension AdminPanelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                     = tableView.dequeueReusableCell(withIdentifier: "Cell") as! StudentCustomTableViewCell
        let user                     = users[indexPath.row]
        cell.firstNameLabel.text     = user.firstName
        cell.secondNameLabel.text    = user.secondName
        cell.groupNumberLabel.text   = user.groupNumber
        cell.columnTestLabel.text    = user.work1Test
        cell.exchangerTestLabel.text = user.work2Test
        
        cell.workResult(user: user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

//MARK: SkeletonView
extension AdminPanelViewController: SkeletonTableViewDataSource {
    public func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "Cell"
    }
}

