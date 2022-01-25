
import Foundation
import UIKit

final class LogInCoordinator: BaseCoordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let factory = ModuleFactory()
        let logInVC = factory.makeLogInModule()
        
        navigationController.pushViewController(logInVC, animated: true)
    }  
}
