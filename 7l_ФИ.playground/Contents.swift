import Cocoa

struct Permit {
    let feature: Feature
    var age: Int
    var lenght: Int
}
struct Feature{
    let name: String
}
enum PermissionError: Error {
    case notAvailable
    case invalidAge
    case invalidLenght
}
enum PlaceNotFound: Error{
    case placeNotFound
}
class UselessGodTycoon{
    var rides = [
        "RollerCoster": Permit (feature: Feature (name: "RollerCoster"), age: 12, lenght: 120),
        "Vomitizer": Permit (feature: Feature (name: "Vomitizer"), age: 18, lenght: 170),
        "Ferris Wheel": Permit (feature: Feature (name: "Ferris Wheel"), age: 6, lenght: 100),
        "Charlie the Choo-Choo": Permit (feature: Feature (name: "Charlie the Choo-Choo"), age: 7, lenght: 70)
        ]
    
    var contestantAge = 13
    var contestantLenght = 80


    func Permission (item name: String) -> (Feature?, PermissionError?) {
        
        guard let choose = rides[name] else {
            return (nil, PermissionError.notAvailable)
        }
        guard contestantAge >= choose.age else{
            return (nil, PermissionError.invalidAge)
        }
        guard contestantLenght >= choose.lenght else{
            return (nil, PermissionError.invalidLenght)
        }
        
        return  (choose.feature, nil)
    }
}
let uselessGodTyconn = UselessGodTycoon ()
let person1 = uselessGodTyconn.Permission(item: "RollerCoster")
let person2 = uselessGodTyconn.Permission(item: "Vomitizer")
let person3 = uselessGodTyconn.Permission(item: "Ferris Wheel")
let person4 = uselessGodTyconn.Permission(item: "Charlie the Choo-Choo")
let person5 = uselessGodTyconn.Permission(item: "F")

if let feature = person1.0 {
    print ("Можете прокатиться на \(feature.name)")
}
else if let error = person1.1 {
    print ("Ошибка: \(error.localizedDescription)")
}
if let feature = person4.0 {
    print ("Можете прокатиться на \(feature.name)")
}
else if let error = person4.1 {
    print ("Ошибка: \(error.localizedDescription)")
}
class NotUselessGodTycoon{
    var rides = [
        "RollerCoster": Permit (feature: Feature (name: "RollerCoster"), age: 12, lenght: 120),
        "Vomitizer": Permit (feature: Feature (name: "Vomitizer"), age: 18, lenght: 170),
        "Ferris Wheel": Permit (feature: Feature (name: "Ferris Wheel"), age: 10, lenght: 100),
        "Charlie the Choo-Choo": Permit (feature: Feature (name: "Charlie the Choo-Choo"), age: 4, lenght: 70)
        ]
    
    var newContestantAge = 17
    var newContestantLenght = 170
    
    func Permission (item name: String) throws -> Feature {
        
        guard let choose = rides[name] else {
            throw PermissionError.notAvailable
        }
        guard newContestantAge >= choose.age else{
            throw PermissionError.invalidAge
        }
        guard newContestantLenght >= choose.lenght else{
            throw PermissionError.invalidLenght
        }
        return  (choose.feature)
    }
}
let ridesArroundTheWorld = [
    "Лондон": "Ferris Wheel",
    "Токио": "RollerCoster",
    "Детройт": "Charlie the Choo-Choo",
    "Париж": "Vomitizer"
]
func noOne (place: String, notUselessGodTycoon: NotUselessGodTycoon) throws -> Feature {
    guard let someRides = ridesArroundTheWorld[place] else {
        throw PlaceNotFound.placeNotFound
    }
    return try notUselessGodTycoon.Permission(item: someRides)
}
var notUselessGodTycoon = NotUselessGodTycoon ()
do {
    let person6 = try noOne (place: "Киото", notUselessGodTycoon: notUselessGodTycoon)
} catch PermissionError.notAvailable {
    print("В этом городе нет такого атракциона")
} catch PermissionError.invalidAge {
    print("Возраст не подходит")
} catch PermissionError.invalidLenght {
    print("Рост не подходит")
} catch let error {
    print(error.localizedDescription)
}
