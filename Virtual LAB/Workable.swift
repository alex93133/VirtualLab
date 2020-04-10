import Foundation


protocol Workable {
    var theory: String { get }
    var questionsList: [String] { get }
    var answersList: [String] { get }
    var rightAnswers: [Int] { get }
}
