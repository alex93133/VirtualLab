import Foundation
import Firebase


// MARK: - Users
struct Users: Codable {
    
    let firstName, secondName, email, groupNumber, test: String
    let workDidFinished: Bool
    
    
    func convertToDictionary() -> Any {
        return ["email": email, "firstName": firstName, "secondName": secondName, "groupNumber": groupNumber, "test": test, "workDidFinished": workDidFinished]
    }
}
