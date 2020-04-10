import Foundation


extension ErrorHandling: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyFields:
            return "Поля не должны быть пустыми"
        case .passwordAreNotSimilar:
            return "Пароли должны совпадать"
        }
    }
}
