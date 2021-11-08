
import Foundation
import UIKit

struct Section {
    static let publication =
    PostSection(post: [
        PostVk(autor: "Discovery", description: "Фотография внутри колец планеты Сатурн, которую сделал космический корабль Кассини.", image: addFiltersImage(image: UIImage(named: "discovery") ?? UIImage(), filter: .crystallize(radius: 3.0)), likes: 185, views: 534),
        PostVk(autor: "KinoPoisk", description: "\"Рик и Морти\" вернулись в духе ранних сезонов - без чрезмерных метазаигрываний и прочих очень странны дел! Но КиноПоиск HD стартовал пятый сезон мультсериала. " , image: addFiltersImage(image: UIImage(named: "kinopoisk") ?? UIImage(), filter: .motionBlur(radius: 1.0)), likes: 300, views: 735),
        PostVk(autor: "Fitness House", description: "Занимайся фитнесом с конфортом! В Fitness House ты: не сорвешь спину (тренер подскажет подходящий вид нагрузки, не получишь \"крестьянский\" загар по футболке (ты же знаешь, что у нас есть солярий) и не замерзнешь в холодной речке!", image: addFiltersImage(image: UIImage(named: "fitness") ?? UIImage(), filter: .posterize), likes: 215, views: 467),
        PostVk(autor: "Интересные сщбытия в Санкт-Петербурге", description: "В Петербурге состоится джазовый концерт Easy Winners. В ресторане Noisy River выступит местный коллектив, исполняющий исключительно архаичные джазовые композиции с помощью необычных предметов, среди которых стиральная доска и казу" , image: addFiltersImage(image: UIImage(named: "spb") ?? UIImage(), filter: .gaussianBlur(radius: 1.0)), likes: 800, views: 954)
    ])
}

