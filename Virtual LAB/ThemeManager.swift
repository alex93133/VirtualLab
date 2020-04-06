import Foundation


class ThemeManager {
    
    var currentThemeID = 0
    static var shared = ThemeManager()
    private init() {}
    
    
    private func identifyThemeID() -> Workable? {
        switch currentThemeID {
        case 1:
            return FirstWork()
        case 2:
            return SecondWork()
        default:
            return nil
        }
    }
    
    typealias data = (theory: String, questionsList: [String], answersList: [String], rightAnswers: [Int])
    
    func getData(handler: (data) -> ()) {
        if let theme = identifyThemeID() {
            let theory        = theme.theory
            let questionsList = theme.questionsList
            let answersList   = theme.answersList
            let rightAnswers  = theme.rightAnswers
            handler((theory, questionsList, answersList, rightAnswers))
        }
    }
}
