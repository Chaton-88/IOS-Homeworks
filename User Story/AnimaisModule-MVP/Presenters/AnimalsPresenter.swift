
import Foundation
import UIKit

protocol AnimalsViewInput: AnyObject {
    func setImage(animal: [UIImage])
}

protocol AnimalsViewOutput: AnyObject {
    func showImage(name: String)
}

final class AnimalsPresenter: AnimalsViewOutput {
    
    weak var viewInput: AnimalsViewInput?
    private var animalsStorage: AnimalStorage
    
    init(animalsStorage: AnimalStorage) {
        self.animalsStorage = animalsStorage
    }
    
    func showImage(name: String) {
        let arrayAnimals = animalsStorage.animalImage.animalsImage
        viewInput?.setImage(animal: arrayAnimals)
    }
}
