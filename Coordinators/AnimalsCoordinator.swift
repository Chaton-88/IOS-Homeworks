
import Foundation
import UIKit

final class AnimalsCoordinator: BaseCoordinator {
    
    let navigationController: UINavigationController
    private var factory: ModuleFactory
    
    init(navigationController: UINavigationController, factory: ModuleFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start(with name: String) {
        let module = AnimalStorage()
        let animalsVC = factory.makeAnimalsModule(module: module)
        animalsVC.presenter.showImage(name: name)
        
        navigationController.pushViewController(animalsVC.view, animated: true)
    }
}


