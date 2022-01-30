
import Foundation
import UIKit

protocol PostFlow: AnyObject {
    
    func coordinateToAnimals(name: String)
}

final class PostCoordinator: BaseCoordinator {
    
    let navigationController: UINavigationController
    private var factory: ModuleFactory
    
    init(navigationController: UINavigationController, factory: ModuleFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start(with title: String) {
        let modelService = AnimalService()
        let postVC = factory.makePostModule(modelService: modelService).view
        postVC.title = title
        postVC.postCoordinator = self
        
        navigationController.pushViewController(postVC, animated: true)
    }
}

extension PostCoordinator: PostFlow {
    
    func coordinateToAnimals(name: String) {
        let animalsCoordinator = AnimalsCoordinator(navigationController: navigationController, factory: factory)
        animalsCoordinator.start(with: name)
    } 
}
