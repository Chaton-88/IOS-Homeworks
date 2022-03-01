
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
        
        let transition = CATransition()
        transition.duration = 2.35
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        navigationController.view.layer.add(transition, forKey: nil)
        navigationController.pushViewController(animalsVC.view, animated: false)
    }
}


