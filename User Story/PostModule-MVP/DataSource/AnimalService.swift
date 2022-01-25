
import Foundation

class AnimalService {
    
    func getAnimal(name:(String), callBack:(Animal?) -> Void) {
        let animals = [Animal(animalName: "Белка"),
                       Animal(animalName: "Верблюд"),
                       Animal(animalName: "Волк"),
                       Animal(animalName: "Жираф"),
                       Animal(animalName: "Заяц"),
                       Animal(animalName: "Зебра"),
                       Animal(animalName: "Корова"),
                       Animal(animalName: "Кошка"),
                       Animal(animalName: "Крокодил"),
                       Animal(animalName: "Кролик"),
                       Animal(animalName: "Лев"),
                       Animal(animalName: "Лиса"),
                       Animal(animalName: "Лошадь"),
                       Animal(animalName: "Медведь"),
                       Animal(animalName: "Обезьяна"),
                       Animal(animalName: "Олень"),
                       Animal(animalName: "Панда"),
                       Animal(animalName: "Свинья"),
                       Animal(animalName: "Слон"),
                       Animal(animalName: "Собака"),
                       Animal(animalName: "Тигр"),
                       Animal(animalName: "Черепаха")]
        
        if let animalName = animals.first(where: {$0.animalName == name}) {
            callBack(animalName)
        } else {
            callBack(nil)
        }
    }
}

