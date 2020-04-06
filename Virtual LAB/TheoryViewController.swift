import UIKit

class TheoryViewController: UIViewController {
    
    
    @IBOutlet weak var theoryTextView: UITextView!
    
    var currentWorkID = ThemeManager.shared.currentThemeID
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(id: currentWorkID)
    }
    
    private func setupView(id: Int) {
        switch id {
        case 1:
            NSStringText.setNSAttributesForTheory(textView: theoryTextView)
        case 2:
            theoryTextView.text = "Какашка"
        default:
            //TODO: Сделать теорию
            return
        }
    }
    
}
