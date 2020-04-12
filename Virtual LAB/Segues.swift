import UIKit


enum Segues {
    static let launch             = "toStart"
    static let admin              = "fromAuthToAdminPanel"
    static let chooseTheme        = "fromAuthToChooseTheme"
    static let chooseThemeFromReg = "fromRegToChooseTheme"
    static let reading            = "fromThemeChoosingToReading"
    static let result             = "toTestResult"
    static let aRWork1            = "fromTestResultToWork1"
    static let aRWork2            = "fromTestResultToWork2"
    static let returnFrom1        = "returnFrom1"
    static let returnFrom2        = "returnFrom2"
}
