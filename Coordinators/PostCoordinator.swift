
import Foundation
import UIKit

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
        postVC.post?.title = title
        
        navigationController.pushViewController(postVC, animated: true)
    }
}
