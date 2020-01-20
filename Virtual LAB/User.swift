
import Foundation
import Firebase


struct UserData {
    let email: String
    let firstName: String
    let secondName: String
    let groupNumber: String
//    let testResult: Int

    
    
    init(email: String, firstName: String, secondName: String, groupNumber: String) {
        self.email = email
        self.firstName = firstName
        self.secondName = secondName
        self.groupNumber = groupNumber
//        self.testResult = testResult

    }
    

    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        email = snapshotValue["email"] as! String
        firstName = snapshotValue["firstName"] as! String
        secondName = snapshotValue["secondName"] as! String
        groupNumber = snapshotValue["groupNumber"] as! String
//        testResult = snapshotValue["testResult"] as! Int
  
    }
    
    
    
    func convertToDictionary() -> Any {
        return ["email": email, "firstName": firstName, "secondName": secondName, "groupNumber": groupNumber]
    }
    
}
