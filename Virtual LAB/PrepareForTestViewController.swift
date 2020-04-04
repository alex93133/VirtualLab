import UIKit

class PrepareForTestViewController: UIViewController {
    
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        let instance              = TestViewController()
        let totalNumberOfQuestion = instance.questionsList.count
        headLabel.font            = UIFont(name: Fonts.mBold, size: 36)
        messageLabel.font         = UIFont(name: Fonts.sFLight, size: 20)
        messageLabel.text         = "\(totalNumberOfQuestion) вопросов по теме"
        self.navigationController?.navigationBar.topItem?.title = ""
    }
}
