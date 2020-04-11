import Foundation


// MARK: - Users
struct Users: Codable {
    
    let firstName, secondName, email, groupNumber: String
    let work1Test, work2Test: String
    let work1DidFinished, work2DidFinished: Bool
    
    
    func convertToDictionary() -> Any {
        return ["email": email,
                "firstName": firstName,
                "secondName": secondName,
                "groupNumber": groupNumber,
                "work1Test": work1Test,
                "work2Test": work2Test,
                "work1DidFinished": work1DidFinished,
                "work2DidFinished": work2DidFinished]
    }
}
