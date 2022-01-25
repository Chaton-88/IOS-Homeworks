
import Foundation
import UIKit

final class ModuleFactory {
    
    func makeFeedModule(model: ModelScenario) -> FeedViewController {
        let controller = FeedViewController(model: model)
        
        return controller
    }
    
    func makePostModule(modelService: AnimalService) -> (presenter: PostPresenter, view: PostViewController) {
        let presenter = PostPresenter(animalService: modelService)
        let controller = PostViewController(presenter: presenter)
        presenter.viewInput = controller
        
        return (presenter, controller)
    }
    
    func makeLogInModule() -> LogInViewController {
        let controller = LogInViewController()
        let factory = MyLoginFactory()
        controller.delegate = factory.checking()
        
        return controller
    }
}
