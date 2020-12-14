import Cocoa

enum Engine {
    case on, off
}
class Property {
    var velocity: Double
    var time: Double
    init (velocity: Double, time: Double) {
        self.velocity = velocity
        self.time = time
    }
}
protocol Car {
    var engine: Engine { get set }
    func calculateMoving () -> Double
}
extension Car {
    mutating func engineOn() {
        self.engine = .on
        print ("Включить")
    }
    mutating func engineOff() {
        self.engine = .off
        print ("Выключить")
    }
}
class SportCar: Property, Car {
    var engine: Engine
    var acceleration: Double
    init (velocity: Double, time: Double, acceleration: Double, engine: Engine) {
        self.engine = engine
        self.acceleration = acceleration
        super.init(velocity: velocity, time: time)
    }
    
    func calculateMoving() -> Double {
        return velocity * time + (acceleration * pow(time, 2))/2
    }
}
extension SportCar: CustomStringConvertible {
    var description: String{
            return ("При скорости \(velocity) км/ч, ускорении \(acceleration) км/(ч^2), за \(time) часа машина проедет \(calculateMoving()) км")
    }
}
var sportCar1 = SportCar (velocity: 120, time: 3.0, acceleration: 3.0, engine: .on)

print (sportCar1.calculateMoving())
print (sportCar1.description)
sportCar1.engineOff()
sportCar1.engineOn()

class TruckCar: Property, Car {
    var engine: Engine
    init (velocity: Double, time: Double, engine: Engine) {
        self.engine = engine
        super.init(velocity: velocity, time: time)
    }
    func calculateMoving() -> Double {
        return velocity * time
    }
}
extension TruckCar: CustomStringConvertible {
    var description: String{
            return ("При скорости \(velocity) км/ч, за \(time) часа машина проедет \(calculateMoving()) км")
    }
}
var truckCar1 = TruckCar (velocity: 60, time: 3.0, engine: .on)
print (truckCar1.calculateMoving())
print (truckCar1.description)
