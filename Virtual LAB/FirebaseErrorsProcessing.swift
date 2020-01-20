import Foundation

struct FirebaseErrorsProcessing {
    
    
    static func showError(error: String) -> String {
        
        let badFormatError      = "The email address is badly formatted."
        let unknownUserError    = "There is no user record corresponding to this identifier. The user may have been deleted."
        let lostConnectionError = "Network error (such as timeout, interrupted connection or unreachable host) has occurred."
        let wrongPassword = "The password is invalid or the user does not have a password."
        
        var errorMessage : String
        
        switch error {
        case badFormatError:
            errorMessage = "Неверный формат данных"
        case unknownUserError:
            errorMessage = "Пользователь не зарегистрирован"
        case lostConnectionError:
            errorMessage = "Проверьте подключение к интернету"
        case wrongPassword:
            errorMessage = "Неверный пароль"
        default:
            errorMessage = "Произошла ошибка"
        }
        return errorMessage
    }

}
