import UIKit
import Firebase


class TestViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet var answersButtons: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var ref: DatabaseReference!
    var questionsList:[String]!
    var answersList:[String]!
    var rightAnswers:[Int]!
    var currentQuestion   = 0
    var totalRightAnswers = 0
    var resultMessage     = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setupView()
        updateQuestion()
        ref = FirebaseManager.shared.ref
    }
    
    private func setupView() {
        headLabel.font                      = UIFont(name: Fonts.mBold, size: 36)
        questionLabel.font                  = UIFont(name: Fonts.sFLight, size: 20)
        firstAnswerButton.titleLabel?.font  = UIFont(name: Fonts.sFRegular, size: 17)
        secondAnswerButton.titleLabel?.font = UIFont(name: Fonts.sFRegular, size: 17)
        thirdAnswerButton.titleLabel?.font  = UIFont(name: Fonts.sFRegular, size: 17)
        RadioButtons.taggingOfButtons(buttonsArray: answersButtons)
        Design.setButtonTextAlignment(buttons: answersButtons)
        Design.disableMultiTouchForButton(buttonsArray: answersButtons)
    }
    
    private func getData() {
        ThemeManager.shared.getData { (data) in
            questionsList = data.questionsList
            answersList   = data.answersList
            rightAnswers  = data.rightAnswers
        }
    }
    
    private func updateQuestion() {
        headLabel.text     = "Вопрос \(currentQuestion + 1) из \(questionsList.count)"
        questionLabel.text = questionsList[currentQuestion]
        firstAnswerButton.setTitle(answersList[3 * currentQuestion], for: .normal)
        secondAnswerButton.setTitle(answersList[3 * currentQuestion + 1], for: .normal)
        thirdAnswerButton.setTitle(answersList[3 * currentQuestion + 2], for: .normal)
    }
    
    private func checkRightAnswer(buttonsArray : [UIButton]) {
        for button in buttonsArray {
            if button.isSelected == true &&  button.tag == rightAnswers[currentQuestion]{
                totalRightAnswers += 1
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.result {
            let dvc = segue.destination as! TestResultViewController
            dvc.message = resultMessage
        }
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let radioButtonInstance = RadioButtons(buttons: answersButtons)
        radioButtonInstance.applyEffect(sender)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        checkRightAnswer(buttonsArray: answersButtons)
        switch currentQuestion {
        case questionsList.count - 2:
            nextButton.setTitle("Завершить выполнение", for: .normal)
            currentQuestion += 1
            updateQuestion()
        case questionsList.count - 1:
            self.resultMessage = "\(totalRightAnswers) из \(questionsList.count)"
            guard let userID = FirebaseManager.shared.getCurrentUserUid() else { return }
            let theme = ThemeManager.shared.currentThemeID
            let userInfoRef = ref.child("Users").child(userID)
            userInfoRef.updateChildValues(["work\(theme)Test": resultMessage])
            performSegue(withIdentifier: Segues.result, sender: nil)
        default:
            currentQuestion += 1
            updateQuestion()
        }
        answersButtons[0].isSelected = false
        answersButtons[1].isSelected = false
        answersButtons[2].isSelected = false
    }
}
