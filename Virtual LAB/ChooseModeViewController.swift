import UIKit


class ChooseModeViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var demoButton: UIButton!
    
    
    override func viewDidLoad() {
        setupView()
    }
    
    private func setupView () {
        NSStringText.setNSAttributesForHeadLabel(label: headLabel)
        NSStringText.setNSAttributesForHelloLabel(label: helloLabel)
        self.navigationController?.navigationBar.topItem?.title = ""
    }
}


