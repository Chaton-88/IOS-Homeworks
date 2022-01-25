
import Foundation
import UIKit

protocol FeedFlow: AnyObject {
    
    func coordinateToPost(title: String)
}

final class FeedCoordinator: BaseCoordinator {
    
    let navigationController: UINavigationController
    private var factory: ModuleFactory
    
    init(navigationController: UINavigationController, factory: ModuleFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    override func start() {
        let model = ModelScenario()
        let feedVC = factory.makeFeedModule(model: model)
        feedVC.feedCoordinator = self
    
        navigationController.pushViewController(feedVC, animated: true)
    }
}

extension FeedCoordinator: FeedFlow {
    
    func coordinateToPost(title: String) {
        let postCoordinator = PostCoordinator(navigationController: navigationController, factory: factory)
        postCoordinator.start(with: title)
        
        self.store(coordinator: postCoordinator)
    }
}
