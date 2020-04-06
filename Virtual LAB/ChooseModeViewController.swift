import UIKit


class ChooseModeViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    
    
    override func viewDidLoad() {
        setupView()
    }
    
    private func setupView () {
        NSStringText.setNSAttributesForHeadLabel(label: headLabel)
        NSStringText.setNSAttributesForHelloLabel(label: helloLabel)
        navigationController?.navigationBar.topItem?.title = ""
    }
}


