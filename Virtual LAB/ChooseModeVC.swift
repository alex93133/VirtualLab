import UIKit


class ChooseMode: UIViewController {
    
    
    //MARK: Outlets
    
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var demoButton: UIButton!
    
    
    //MARK: View life cycle
    
    
    override func viewDidLoad() {
        setupView()
    }    
}


