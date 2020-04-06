import Foundation


// MARK: - Users
struct Users: Codable {
    
    let firstName, secondName, email, groupNumber: String
    let works: [Work]?
    
    func convertToDictionary() -> Any {
        return ["email": email, "firstName": firstName, "secondName": secondName, "groupNumber": groupNumber]
    }
}


// MARK: - Work
struct Work: Codable {

    let id: Int
    var test = "Не выполнен"
    var workDidFinished = false
    
    func convertToDictionary() -> Any {
           return ["id": id, "test": test, "workDidFinished": workDidFinished]
       }
}
