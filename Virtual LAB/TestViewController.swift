import UIKit
import Firebase


class TestViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet var answersButton: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        updateQuestion()
        ref = Database.database().reference()
    }
    
    
    let questionsList = FirstWork.questionsList
    let answersList   = FirstWork.answersList
    let rightAnswers  = FirstWork.rightAnswers
    
    var currentQuestion   = 0
    var totalRightAnswers = 0
    var resultMessage     = ""
    
    var ref: DatabaseReference!
    
    private func setupView() {
        headLabel.font                      = UIFont(name: Fonts.mBold, size: 36)
        questionLabel.font                  = UIFont(name: Fonts.sFLight, size: 20)
        firstAnswerButton.titleLabel?.font  = UIFont(name: Fonts.sFRegular, size: 17)
        secondAnswerButton.titleLabel?.font = UIFont(name: Fonts.sFRegular, size: 17)
        thirdAnswerButton.titleLabel?.font  = UIFont(name: Fonts.sFRegular, size: 17)
        RadioButtons.taggingOfButtons(buttonsArray: answersButton)
        Design.setButtonTextAligment(butttons: answersButton)
        Design.disableMultiTouchForButton(buttonsArray: answersButton)
    }
    
    private func updateQuestion() {
        headLabel.text                      = "Вопрос \(currentQuestion + 1) из \(questionsList.count)"
        questionLabel.text                  = questionsList[currentQuestion]
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
            let navController = segue.destination as! UINavigationController
            let detailController = navController.topViewController as! TestResultViewController
            detailController.message = self.resultMessage
        }
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let radioButtonInstance = RadioButtons(firstAnswerButton: answersButton[0], secondAnswerButton: answersButton[1], thirdAnswerButton: answersButton[2])
        radioButtonInstance.applyEffect(sender)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        checkRightAnswer(buttonsArray: answersButton)
        
        switch currentQuestion {
        case questionsList.count - 2:
            nextButton.setTitle("Завершить выполнение", for: .normal)
            currentQuestion += 1
            updateQuestion()
        case questionsList.count - 1:
            self.resultMessage = "\(totalRightAnswers) из \(questionsList.count)"
            print(resultMessage)
            guard let userID = Auth.auth().currentUser?.uid else { return }
            let userInfoRef = self.ref.child("Users").child(userID)
            userInfoRef.updateChildValues(["test": resultMessage])
            
            performSegue(withIdentifier: Segues.result, sender: nil)
        default:
            currentQuestion += 1
            updateQuestion()
        }
        answersButton[0].isSelected = false
        answersButton[1].isSelected = false
        answersButton[2].isSelected = false
    }
}
