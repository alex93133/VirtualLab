import UIKit

class PrepareForTest: UIViewController {
    
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let instance              = Test()
        let totalNumberOfQuestion = instance.questionsList.count
        headLabel.font            = UIFont(name: "Montserrat-ExtraBold", size: 36)
        messageLabel.font         = UIFont(name: "SFProDisplay-Light", size: 20)
        messageLabel.text         = "\(totalNumberOfQuestion) вопросов по теме"
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        self.navigationController?.navigationBar.topItem?.title = ""
        
        
    }
}
