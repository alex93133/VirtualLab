import UIKit
import Firebase

class Test: UIViewController {
    
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    @IBOutlet var answersButton: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headLabel.font                      = UIFont(name: "Montserrat-ExtraBold", size: 36)
        questionLabel.font                  = UIFont(name: "SFProDisplay-Light", size: 20)
        firstAnswerButton.titleLabel?.font  = UIFont(name: "SFProDisplay-Regular", size: 17)
        secondAnswerButton.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        thirdAnswerButton.titleLabel?.font  = UIFont(name: "SFProDisplay-Regular", size: 17)
        
        self.view.backgroundColor  = UIColor(named: "BackgroundColor")
        
        updateQuestion()
        RadioButtons.taggingOfButtons(buttonsArray: answersButton)
        Attributing.setButtonTextAligment(butttons: answersButton)
        Attributing.disableMultiTouchForButton(buttonsArray: answersButton)
        ref = Database.database().reference()
    }
    
    let questionsList = ["Высота тарельчатой колонны зависит:",
                         "От чего зависит расстояние между тарелками?",
                         "К каким методам переработки нефти относится ректификация:",
                         "Ректификация — это:",
                         "Исчерпывающие и укрепляющие колонны относятся к:",
                         "Что такое флегма?",
                         "Типы ректификационных колонн:"]
    
    let answersList = ["количества тарелок и расстояния между ними",
                       "от диаметра и давления в аппарате",
                       "от среды",
                       "высоты колонны",
                       "количества тарелок",
                       "диаметра колонны",
                       "физическим",
                       "химическим",
                       "механическим",
                       "массообменный процесс поглощения газов или жидкостей поверхностью твердого сорбента",
                       "физический процесс разделения жидких смесей взаимно растворимых компонентов, различающихся температурами кипения",
                       "метод разделения взаимно-растворимых компонентов на основе добавления селективного растворителя",
                       "полным",
                       "неполным",
                       "сложным",
                       "пар, выходящий из верхней части колонны, конденсация которого дает готовый продукт",
                       "компонент из нижней части колонны",
                       "жидкость, поступающая на орошение колонны",
                       "роторная, тарельчатая, насадочная",
                       "с неподвижным слоем сорбента, с движущимся слоем сорбента, с псевдоожиженным слоем",
                       "пульсационные и вибрационные"]
    
    let rightAnswers      = [1, 3, 1, 2, 2, 3, 1]
    
    var currentQuestion   = 0
    
    var totalRightAnswers = 0
    
    var resultMessage     = ""
    
    var ref: DatabaseReference!
    
    
    func updateQuestion() {
        headLabel.text                      = "Вопрос \(currentQuestion + 1) из \(questionsList.count)"
        questionLabel.text                  = questionsList[currentQuestion]
        firstAnswerButton.setTitle(answersList[3 * currentQuestion], for: .normal)
        secondAnswerButton.setTitle(answersList[3 * currentQuestion + 1], for: .normal)
        thirdAnswerButton.setTitle(answersList[3 * currentQuestion + 2], for: .normal)
        
    }
    

    func checkRightAnswer(buttonsArray : [UIButton]) {
        
        for button in buttonsArray {
            if button.isSelected == true &&  button.tag == rightAnswers[currentQuestion]{
                totalRightAnswers += 1
            }
        }
    }
    
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTestResult" {
            let navController = segue.destination as! UINavigationController
            let detailController = navController.topViewController as! TestResult
            detailController.message = self.resultMessage
            print(resultMessage)
        }
    }
    
    
    //MARK: Actions
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
         let radioButtonInstance = RadioButtons(firstAnswerButton: answersButton[0],
                                                      secondAnswerButton: answersButton[1],
                                                      thirdAnswerButton: answersButton[2])
               radioButtonInstance.answerButtonPressed(sender)
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
           
            performSegue(withIdentifier: "toTestResult", sender: nil)
            
        default:
            currentQuestion += 1
            updateQuestion()
        }
        answersButton[0].isSelected = false
        answersButton[1].isSelected = false
        answersButton[2].isSelected = false
        
    }
    
    
   
    
}
