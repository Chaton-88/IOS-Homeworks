
import Foundation

class BaseCoordinator: Coordinator {
   
    var childCoordinators: [Coordinator] = []
    var isCompleted: (() -> ())?
    
    func start() {
        fatalError("Children shoud implement start.")
    }
}
