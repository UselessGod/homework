import Cocoa

enum WindowState{
    case open, close
}
enum Engine {
    case on, off
}

struct Ferrari {
    let kind: String
    let year: Int
    let volume: Double
    let windowState: WindowState
    var engine: Engine
    var fullness: Double
  
    mutating func engineOn (){
        self.engine = .on
    }
    mutating func engineOff (){
        self.engine = .off
    }
    func printFulfilness(){
        print ("в багажнике лежит \(fullness) кг")
    }
}

struct Belaz {
    let kind: String
    let year: Int
    let volume: Double
    let windowState: WindowState
    let engine: Engine
    var fullness: Double
    
    func percent (){
        print ("Процент заполнения Белаза \(kind) - \(fullness*100/volume) %")
    }
}

var sportCar1 = Ferrari(kind: "F8", year: 2020, volume: 120, windowState: .open, engine: .on, fullness: 65)
var sportCar2 = Ferrari(kind: "812", year: 2019, volume: 120, windowState: .close, engine: .off, fullness: 45)
var truckCar1 = Belaz(kind: "7540", year: 2020, volume: 30000, windowState: .close, engine: .off, fullness: 20000)
var truckCar2 = Belaz(kind: "7555", year: 2020, volume: 60000, windowState: .open, engine: .off, fullness: 30000)

print (sportCar2.kind)
truckCar2.windowState
truckCar1.fullness = 0
truckCar2.percent ()
print ("Заполненность кузова белаза", truckCar1.fullness, "л")

sportCar1.engineOff()
print ("Двигатель Феррари", sportCar1.kind, "-", sportCar1.engine)
sportCar1.printFulfilness()

