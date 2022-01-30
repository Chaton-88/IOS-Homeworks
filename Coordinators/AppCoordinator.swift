
import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    
    private let navigationController = UINavigationController()
    
    private let tabBarController: UITabBarController
    private var factory: ModuleFactory
    
    init(tabBarController: UITabBarController, factory: ModuleFactory) {
        self.tabBarController = tabBarController
        self.factory = factory
    }
    
    override func start() {
        
        let feedCoordinator = createFeedCoordinator()
        let logInCoordinator = createLogInCoordinator()
        tabBarController.viewControllers = [feedCoordinator .navigationController, logInCoordinator.navigationController]
        
        self.store(coordinator: feedCoordinator)
        self.store(coordinator: logInCoordinator)
        
        feedCoordinator.start()
        logInCoordinator.start()
        
        feedCoordinator.isCompleted = { [weak self] in
            self?.free(coordinator: feedCoordinator)
        }
        
        logInCoordinator.isCompleted = { [weak self] in
            self?.free(coordinator: logInCoordinator)
        }
    }
}

// MARK: - Create Tab bar coordinators
extension AppCoordinator {
    
    private func createFeedCoordinator() -> FeedCoordinator {
        let navigationFirst = UINavigationController()
        navigationFirst.tabBarItem =
        UITabBarItem(
            title: "Feed",
            image: UIImage(systemName: "square.and.pencil"),
            tag: 1)
        
        let factory = ModuleFactory()
        let coordinator = FeedCoordinator(
            navigationController: navigationFirst,
            factory: factory)
        
        return coordinator
    }
    
    private func createLogInCoordinator() -> LogInCoordinator {
        let navigationSecond = UINavigationController()
        navigationSecond.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            tag: 2)
        
        let coordinator = LogInCoordinator(navigationController: navigationSecond)
        
        return coordinator
    }
}
