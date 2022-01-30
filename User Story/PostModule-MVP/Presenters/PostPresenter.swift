
import Foundation

protocol PostViewInput: AnyObject {
    func setPicturing(animal named: String, text: String, examination: Bool)
}

protocol PostViewOutput: AnyObject {
    func showPicturing(name: String, show: Bool)
}

final class PostPresenter: PostViewOutput {
    
    weak var viewInput: PostViewInput?
    private let animalsService: AnimalService
    
    init(animalService: AnimalService) {
        self.animalsService = animalService
    }
    
    func showPicturing(name: String, show: Bool) {
        
        animalsService.getAnimal(name: name, isRouting: show) { [weak self] animals in
            if let animals = animals {
                self?.viewInput?.setPicturing(animal: animals.animalName, text: "", examination: true)
            } else {
                self?.viewInput?.setPicturing(animal: "error", text: "К сожалению, такого животного нет...", examination: false)
            }
        }
    }
}
