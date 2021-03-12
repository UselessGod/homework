import Cocoa
 
class Human {
    var temperature: Double
    init (temperature: Double) {
        self.temperature = temperature
    }
}

struct Queue <T> {
    var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeLast()
    }
}

var tOH = Queue<Human>()

tOH.push(Human (temperature: 36.6))
tOH.push(Human (temperature: 37.2))
tOH.push(Human (temperature: 372.2))
tOH.push(Human (temperature: 29.2))
tOH.push(Human (temperature: 36.2))
tOH.push(Human (temperature: 10.5))
tOH.push(Human (temperature: 37.0))
tOH.push(Human (temperature: 100000))

var arrayOfHumans = [Double]()
for i in 0...tOH.elements.endIndex-1 {
    arrayOfHumans.append(tOH.elements[i].temperature)
}
print (arrayOfHumans)

let healthy: (Double) -> Bool = { (element: Double) -> Bool in  // здоровые
    return element < 37 && element >= 36
}

let sick: (Double) -> Bool = { (element: Double) -> Bool in     //больные
    return element <= 42 && element >= 37 || element < 36 && element >= 30
}

let notHuman: (Double) -> Bool = { (element: Double) -> Bool in //нелюди
    return element < 30 || element > 42
    
}

func filter(arrayOfHumans: [Double], predicate: (Double) -> Bool ) -> [Double] {
    var tmpArray = [Double]()
    for element in arrayOfHumans {
        if predicate(element) {
            tmpArray.append(element)
        }
    }
    return tmpArray
}
filter(arrayOfHumans: arrayOfHumans, predicate: healthy)
filter(arrayOfHumans: arrayOfHumans, predicate: notHuman)
filter(arrayOfHumans: arrayOfHumans, predicate: sick)


