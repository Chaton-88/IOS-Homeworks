
import UIKit

extension UIViewController {
    func showAlert(withError: String) {
        let alertController = UIAlertController(title: "error", message: withError, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        
        self.navigationController?.present(alertController, animated: true)
    }
}

