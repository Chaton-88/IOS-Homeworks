
import UIKit

class Checker {
    static let shared = Checker()
    
    private let logIn = "Incognito"
    private let pswd = "StrongPassword"
    
    func examination(login: String, password: String) -> Bool? {
        
        guard login == logIn, password == pswd else { return nil }
        return true
    }
}


