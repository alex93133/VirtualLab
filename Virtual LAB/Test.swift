

import UIKit
import Firebase

class Test: UIViewController {
    
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    @IBOutlet weak var firstAnswerLabel: UILabel!
    @IBOutlet weak var secondAnswerLabel: UILabel!
    @IBOutlet weak var thirdAnswerLabel: UILabel!
    
    @IBOutlet var answersButton: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headLabel.font         = UIFont(name: "Montserrat-ExtraBold", size: 36)
        questionLabel.font     = UIFont(name: "SFProDisplay-Light", size: 20)
        firstAnswerLabel.font  = UIFont(name: "SFProDisplay-Regular", size: 17)
        secondAnswerLabel.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        thirdAnswerLabel.font  = UIFont(name: "SFProDisplay-Regular", size: 17)
        
        self.view.backgroundColor  = UIColor(named: "BackgroundColor")
        
        updateQuestion()
        taggingOfButtons(buttonsArray: answersButton)
        ref = Database.database().reference()
    }
    
    let questionsList = ["Высота тарельчатой колонны зависит:",
                         "От чего зависит расстояние между тарелками?",
                         "К каким методам переработки нефти относится ректификация:",
                         "Ректификация — это:",
                         "Исчерпывающие и укрепляющие колонны относятся к:",
                         "Что такое флегма?",
                         "Типы ректификационных колонн:"]
    
    let answersList = ["количества тарелок и расстояния между ними;",
                       "от диаметра и давления в аппарате;",
                       "от среды.",
                       "высоты колонны;",
                       "количества тарелок;",
                       "диаметра колонны.",
                       "физическим;",
                       "химическим;",
                       "механическим.",
                       "массообменный процесс поглощения газов или жидкостей поверхностью твердого сорбента;",
                       "физический процесс разделения жидких смесей взаимно растворимых компонентов, различающихся температурами кипения;",
                       "метод разделения взаимно-растворимых компонентов на основе добавления селективного растворителя.",
                       "полным;",
                       "неполным;",
                       "сложным.",
                       "пар, выходящий из верхней части колонны, конденсация которого дает готовый продукт;",
                       "компонент из нижней части колонны;",
                       "жидкость, поступающая на орошение колонны.",
                       "роторная, тарельчатая, насадочная;",
                       "с неподвижным слоем сорбента, с движущимся слоем сорбента, с псевдоожиженным слоем;",
                       "пульсационные и вибрационные."]
    
    let rightAnswers      = [1, 3, 1, 2, 2, 3, 1]
    
    var currentQuestion   = 0
    
    var totalRightAnswers = 0
    
    var resultMessage     = ""
    
    var ref: DatabaseReference!
    
    
    func updateQuestion() {
        headLabel.text         = "Вопрос \(currentQuestion + 1) из \(questionsList.count)"
        questionLabel.text     = questionsList[currentQuestion]
        firstAnswerLabel.text  = answersList[3 * currentQuestion ]
        secondAnswerLabel.text = answersList[3 * currentQuestion + 1]
        thirdAnswerLabel.text  = answersList[3 * currentQuestion + 2]
        
    }
    
    
    func taggingOfButtons (buttonsArray : [UIButton]) {
        var tagForButton = 1
        for button in buttonsArray {
            button.tag = tagForButton
            tagForButton += 1
        }
    }
    
    
    func changeCheckBox (_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        
    }
    

    func checkRightAnswer(buttonsArray : [UIButton]) {
        
        for button in buttonsArray {
            if button.isSelected == true &&  button.tag == rightAnswers[currentQuestion]{
                totalRightAnswers += 1
            }
        }
    }
    
    
    //MARK: Actions
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        changeCheckBox(sender)
        
        switch sender.tag {
        case 1:
            secondAnswerButton.isSelected = false
            thirdAnswerButton.isSelected  = false
        case 2:
            firstAnswerButton.isSelected = false
            thirdAnswerButton.isSelected = false
        case 3:
            firstAnswerButton.isSelected  = false
            secondAnswerButton.isSelected = false
        default: print(sender.tag)
        }
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        checkRightAnswer(buttonsArray: answersButton)
        
        switch currentQuestion {
        case questionsList.count - 2:
            nextButton.setTitle("Завершить выполнение", for: .normal)
            currentQuestion += 1
            updateQuestion()
        case questionsList.count - 1:
            resultMessage = "\(totalRightAnswers) из \(questionsList.count)"
            
            guard let userID = Auth.auth().currentUser?.uid else { return }
            let userInfoRef = self.ref.child("Users").child(userID)
            userInfoRef.updateChildValues(["Результат теста": resultMessage])
            
            performSegue(withIdentifier: "toTestResult", sender: nil)
        default:
            currentQuestion += 1
            updateQuestion()
        }
        firstAnswerButton.isSelected  = false
        secondAnswerButton.isSelected = false
        thirdAnswerButton.isSelected  = false
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? TestResult else { return }
        dvc.message = resultMessage
    }
    
}
