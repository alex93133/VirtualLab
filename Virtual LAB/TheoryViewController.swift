import UIKit

class TheoryViewController: UIViewController {
    
    
    @IBOutlet weak var theoryTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        NSStringText.setNSAttributesForTheory(textView: theoryTextView)
    }
    
}
