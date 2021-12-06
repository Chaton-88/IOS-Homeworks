
import UIKit

class LoginInspector: LoginViewControllerDelegate {

    func checkingValues(login: String, password: String) -> Bool? {
        Checker.shared.examination(login: login, password: password)
    }
}
