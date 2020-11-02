enum SportCarBrands {
    case Toyota
    case VloksWagen
    case Mercedes
}

enum TrunkCarBrands {
    case Volvo
    case MAN
    case Scania
}

enum EngineStates {
    case started, stopped
}

enum WindowsStates {
    case oppened, clossed
}

enum HatchStates {
    case oppened, clossed
}


protocol Car: AnyObject {
    var yearOfManufacture: Int {get set}
    var engineState: EngineStates {get set}
    var windowsState: WindowsStates {get set}
    func StartEngine()
    func StopEngine()
    func OpenWindows()
    func CloseWindows()
    
}

extension Car {
    func StartEngine() {
        self.engineState = .started
    }
    func StopEngine() {
        self.engineState = .stopped
    }
    func CloseWindows() {
        self.windowsState = .clossed
    }
    func OpenWindows() {
        self.windowsState = .oppened
    }
}

class SportCar: Car {
    var windowsState: WindowsStates {
        didSet {
            switch windowsState {
            case .oppened:
                print("Открыли окна \n")
            case .clossed:
                print("Закрыли окна \n")
            }
        }
    }
    var yearOfManufacture: Int
    var engineState: EngineStates {
        didSet {
            switch engineState {
            case .started:
                print("Запустили двигатель \n")
            case .stopped:
                print("Остановили двигатель \n")
            }
        }
    }
    let brand: SportCarBrands
    var hatch: HatchStates
    
    init(brand: SportCarBrands, yearOfManufacture: Int, engineState: EngineStates, windowsState: WindowsStates, hatchState: HatchStates) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.engineState = engineState
        self.windowsState = windowsState
        self.hatch = hatchState
    }
    func OpenHatch() {
        self.hatch = .oppened
    }
    func CloseHatch() {
        self.hatch = .clossed
    }
    
}

class TrunkCar: Car {
    let brand: TrunkCarBrands
    var windowsState: WindowsStates {
        didSet {
            switch windowsState {
            case .oppened:
                print("Открыли окна \n")
            case .clossed:
                print("Закрыли окна \n")
            }
        }
    }
    var yearOfManufacture: Int
    var engineState: EngineStates {
        didSet {
            switch engineState {
            case .started:
                print("Запустили двигатель \n")
            case .stopped:
                print("Остановили двигатель \n")
            }
        }
    }
    var trunkCapacity: Int
    var loadedVolumeOfTrunk: Int {
        didSet {
            print("В кузов загрузили: \(loadedVolumeOfTrunk)\n")
        }
    }
    
    
    init(brand: TrunkCarBrands, yearOfManufacture: Int, engineState: EngineStates, windowsState: WindowsStates, trunkCapacity: Int) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkCapacity = trunkCapacity
        self.loadedVolumeOfTrunk = 0
    }
    func LoadTrunk(volume: Int) {
        if loadedVolumeOfTrunk + volume <= trunkCapacity {
            loadedVolumeOfTrunk += volume } else {
            print("Невозможно загрузить! Превышение объема!!!\n")
        }
    }
    func UnloadTrunk(volume: Int) {
        if loadedVolumeOfTrunk >= volume {
            loadedVolumeOfTrunk -= volume } else {
            print("Невозможно выгрузить больше, чем загружено!!!\n")
        }
    }
}

extension TrunkCar: CustomStringConvertible{
    var description: String{
        return "Грузовой автомобиль: \nМарка: \(brand) \nГод выпуска: \(yearOfManufacture) \nСостояние двигателя: \(engineState)\nОкна: \(windowsState) \nОбъем кузова: \(trunkCapacity) \nЗагружено: \(loadedVolumeOfTrunk)\n"
    }
}

extension SportCar: CustomStringConvertible{
    var description: String{
        return "Легковой автомобиль: \nМарка: \(brand) \nГод выпуска: \(yearOfManufacture) \nСостояние двигателя: \(engineState)\nОкна: \(windowsState) \nЛюк: \(hatch)\n"
    }
}

var mySportCar = SportCar(brand: .Toyota, yearOfManufacture: 2017, engineState: .stopped, windowsState: .clossed, hatchState: .clossed)
print(mySportCar)

mySportCar.StartEngine()
mySportCar.OpenWindows()
mySportCar.OpenHatch()
print(mySportCar)


var myTrunkCar = TrunkCar(brand: .MAN, yearOfManufacture: 2020, engineState: .stopped, windowsState: .clossed, trunkCapacity: 2000)
print(myTrunkCar)

myTrunkCar.StartEngine()
myTrunkCar.OpenWindows()
myTrunkCar.LoadTrunk(volume: 500)
print(myTrunkCar)
