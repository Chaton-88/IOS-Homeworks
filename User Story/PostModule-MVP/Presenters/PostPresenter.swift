

import Foundation

protocol PostViewInput: AnyObject {
    func setPicturing(animal named: String, text: String)
}

protocol PostViewOutput: AnyObject {
    func showPicturing(name: String)
}

final class PostPresenter: PostViewOutput {
    
    weak var viewInput: PostViewInput?
    private let animalsService: AnimalService
    
    init(animalService: AnimalService) {
        self.animalsService = animalService
    }
    
    func showPicturing(name: String) {
        
        animalsService.getAnimal(name: name) { [weak self] animals in
            if let animals = animals {
                self?.viewInput?.setPicturing(animal: animals.animalName, text: "")
            } else {
                self?.viewInput?.setPicturing(animal: "error", text: "К сожалению, такого животного нет...")
            }
        }
    }
}
