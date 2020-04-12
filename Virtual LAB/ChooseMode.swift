import UIKit


class ChooseModeViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var demoButton: UIButton!
    
    
    override func viewDidLoad() {
        
        Attributing.setNSAttributesForHeadLabel(label: headLabel)
        Attributing.setNSAttributesForHelloLabel(label: helloLabel)
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        
        self.view.backgroundColor  = UIColor(named: "BackgroundColor")
        demoButton.backgroundColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 0.12)
        
    }    
}


