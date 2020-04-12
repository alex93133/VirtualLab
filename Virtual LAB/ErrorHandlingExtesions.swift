import Foundation


extension ErrorHandling: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyFields:
            return "Поля не должны быть пустыми"
        case .passwordAreNotSimilar:
            return "Пароли должны совпадать"
        case .invalidType:
            return "Неверный формат"
        case .invalidEmail:
            return "Неверный формат email"
        case .shortPassword:
            return "Пароль должен быть не менее 6 символов"
        }
    }
}
