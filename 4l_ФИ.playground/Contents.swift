import Cocoa

enum WindowState{
    case open, close
}
enum Engine {
    case on, off
}
enum Trailer {
    case add, remove
}
enum Wheel: Int {
    case zero = 0, one = 1, two = 2, three = 3, four = 4, five = 5
}
            

class Cars {
    var year: Int
    var volume: Double
    var windowState: WindowState
    var engine: Engine
    var fullness: Double
    
    init (year: Int, volume: Double, windowState: WindowState, engine: Engine, fullness: Double) {
        self.year = year
        self.volume = volume
        self.windowState = windowState
        self.engine = engine
        self.fullness = fullness
    }
    func engineOn (){
        self.engine = .on
    }
    func engineOff (){
        self.engine = .off
    }
    func windowOpen (){
        self.windowState = .open
    }
    func windowClosed (){
        self.windowState = .close
    }
}
var car1 = Cars (year: 1999, volume: 100, windowState: .open, engine: .on, fullness: 50)
var car2 = Cars (year: 2020, volume: 0, windowState: .close, engine: .off, fullness: 0)

class SportCAR: Cars {
    var wheel: Wheel
    init (year: Int, volume: Double, windowState: WindowState, engine: Engine, fullness: Double, wheel: Wheel) {
        self.wheel = wheel
        super.init (year: year, volume: volume, windowState: windowState, engine: engine, fullness: fullness)
        }
    func NOW () {   //number of wheels
        if (wheel == Wheel(rawValue: 0) || wheel == Wheel(rawValue: 1) || wheel == Wheel(rawValue: 3)){
            print ("Срочно почините машину!")
        }
        else if (wheel == Wheel(rawValue: 2)){
            print ("Да это же мотоцикл")
        }
        else if (wheel == Wheel(rawValue: 4)){
            print ("Это норма!")
        }
        else if (wheel == Wheel(rawValue: 5)){
            print ("Что ты такое?")
        }
    }
}
var sportCar1 = SportCAR (year: 2016, volume: 0, windowState: .close, engine: .on, fullness: 0, wheel: Wheel(rawValue: 0)!)
var sportCar2 = SportCAR (year: 2020, volume: 200, windowState: .open, engine: .off, fullness: 100, wheel: Wheel(rawValue: 4)!)
print (sportCar1.NOW())

print (sportCar2.NOW())
print ("В машине ещё", sportCar2.volume - sportCar2.fullness, "места")

class TruckCar: Cars {
    var trailer: Trailer
    init (year: Int, volume: Double, windowState: WindowState, engine: Engine, fullness: Double, trailer: Trailer) {
        self.trailer = trailer
        super.init (year: year, volume: volume, windowState: windowState, engine: engine, fullness: fullness)
    }
    func trailerAdd (){
        self.trailer = .add
        print ("Теперь можно в путь")
    }
    func trailerRemove (){
        self.trailer = .remove
        print ("Куда же ты собрался, прицеп забыл")
    }
}
var truckCar1 = TruckCar (year: 1980, volume: 10000, windowState: .close, engine: .on, fullness: 10000, trailer: .add)
truckCar1.trailerRemove()
print ("Год выпуска - ", truckCar1.year)
