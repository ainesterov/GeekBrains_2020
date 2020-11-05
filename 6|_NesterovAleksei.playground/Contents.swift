enum CarBrands {
    case Audi
    case Toyota
    case BMW
}
protocol fuelable {
    var fuelFilledUp: Double { get set }
}

class Car: fuelable {
    var brand: CarBrands
    var fuelFilledUp: Double
    init (brand: CarBrands, fuelFilledUp: Double) {
        self.brand = brand
        self.fuelFilledUp = fuelFilledUp
    }
}

class Bus: fuelable {
    var fuelFilledUp: Double
    init (fuelFilledUp: Double) {
        self.fuelFilledUp = fuelFilledUp
    }
}

class Truсk: fuelable {
    var fuelFilledUp: Double
    init (fuelFilledUp: Double) {
        self.fuelFilledUp = fuelFilledUp
    }
}

struct Queue<T: fuelable> {   //Очередь заправки на АЗС (автомобили, мотоциклы, грузовики)
    private var elements: [T] = []
    var fuelFilledUp: Double {
        var totalFuel: Double = 0.0
        for elem in elements {
            totalFuel += elem.fuelFilledUp
        }
        return totalFuel
    }
    
    mutating func getInLine(_ elem: T) {
        elements.append(elem)
    }
    
    mutating func fillUp() -> T {
        return elements.removeFirst()
    }
    
    mutating func filter(predicate: (Double) -> Bool) -> [T] {
        var tempElem: [T] = []
        for elem in elements {
            if predicate(elem.fuelFilledUp) {
                tempElem.append(elem)
            }
        }
        return tempElem
    }
}

var queueOfCars = Queue<Car>()
queueOfCars.getInLine(Car(brand: .Audi, fuelFilledUp: 100))
queueOfCars.getInLine(Car(brand: .Toyota, fuelFilledUp: 150))
queueOfCars.getInLine(Car(brand: .BMW, fuelFilledUp: 20))
var newqueue = queueOfCars.filter(){return $0 >= 100.0} //допустим необходимо получить транспортные средства из очереди бак которых больше 100 литров с целью их преимущественной заправки
newqueue
print(queueOfCars.fillUp().fuelFilledUp)
print(queueOfCars.fillUp().fuelFilledUp)
print(queueOfCars.fillUp().fuelFilledUp)

