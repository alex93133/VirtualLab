import UIKit


class ChooseModeViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var helloMessageLabel: UILabel!
    
    
    override func viewDidLoad() {
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Design.navBarIsTransparent(transparent: true)
    }
    
    private func setupView () {
        NSStringText.setNSAttributesForHeadLabel(label: headLabel)
        NSStringText.setNSAttributesForHelloLabel(label: helloMessageLabel)
    }
}


