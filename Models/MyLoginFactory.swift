
import Foundation

protocol LoginFactory {
    
    func checking() -> LoginViewControllerDelegate
}

class MyLoginFactory: LoginFactory {
    
    func checking() -> LoginViewControllerDelegate {
        return LoginInspector()
    }
}

