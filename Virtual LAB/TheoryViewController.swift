import UIKit


class TheoryViewController: UIViewController {
    
    @IBOutlet weak var theoryTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let theme = ThemeManager.shared.currentThemeID
        switch theme {
        case 1:
            NSStringText.getNSForColumnAssembly(textView: theoryTextView)
        case 2:
            NSStringText.getNSForHeatExchanger(textView: theoryTextView)
        default:
            return
        }
    }
}
