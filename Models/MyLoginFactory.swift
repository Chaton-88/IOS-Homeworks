
import Foundation

protocol LoginFactory {
    
    func checking() -> LoginViewControllerDelegate
}

class MyLoginFactiry: LoginFactory {
    
    static let defaltFactory = MyLoginFactiry()
    
    func checking() -> LoginViewControllerDelegate {
        return LoginInspector()
    }
}

