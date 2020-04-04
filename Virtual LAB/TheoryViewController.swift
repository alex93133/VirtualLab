import UIKit

class TheoryViewController: UIViewController {
    
    
    @IBOutlet weak var theoryTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSStringText.setNSAttributesForTheory(textView: theoryTextView)
    }
    
}
