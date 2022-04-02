
import Foundation

final class ModelScenario {
    
    private let password = "Password"
    
    func check(word: String, onCheck: (Bool) -> Void) {
        var isResult: Bool
        if word == password {
            isResult = true
        } else {
            isResult = false
        }
        onCheck(isResult)
    }
}

