enum BrandSportCar {
    case Toyota
    case VolksWagen
    case Mercedes
}

enum BrandTrunkCar {
    case Volvo
    case Man
    case Scania
}

enum EngineState {
    case started, stopped
}

enum WindowState {
    case opened, closed
}

enum EngineActions {
    case start,stop
}

class Car {
    let yearOfManufacture: Int
    var trunkCapacity: Int
    var engineState: EngineState {
        didSet {
            print("Двигатель: \(self.engineState)\n")
        }
    }
    
    var windowsState: WindowState {
        didSet {
            print("Окна: \(self.windowsState)\n")
        }
    }
    
    var loadedVolumeOfTrunk: Int {
        didSet {
            print("В багажник загружено: \(self.loadedVolumeOfTrunk)\n")
        }
    }
    
    init(yearOfManufacture: Int, engineState: EngineState, windowsState: WindowState, trunkCapacity: Int) {
        self.yearOfManufacture = yearOfManufacture
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkCapacity = trunkCapacity
        self.loadedVolumeOfTrunk = 0
    }
    
    func StartEngine() {
        engineState = .started
        print("Двигатель запущен")
    }
    
    func StopEngine() {
        engineState = .stopped
        print("Двигатель остановлен")
    }
    
    func OpenWindow() {
        windowsState = .opened
        print("Окнв открыты")
    }
    
    func CloseWindow() {
        windowsState = .closed
        print("Окна закрыты")
    }
    
    func LoadTrunk(volume: Int) {
        if loadedVolumeOfTrunk + volume <= trunkCapacity {
            loadedVolumeOfTrunk += volume } else {
            print("Невозможно загрузить! Превышение объема!!!\n")
        }
    }
    func UnLoadTrunk(volume: Int) {
        if loadedVolumeOfTrunk >= volume {
            loadedVolumeOfTrunk -= volume } else {
            print("Невозможно выгрузить больше, чем загружено!!!\n")
        }
    }
    func StartStopEngine(action: EngineActions) {
        switch action {
        case .start:
            engineState = .started
        case .stop:
            engineState = .stopped
        }
    }
    
    func PrintPropertiesAndStates() {
        
    }
}

class SportCar: Car {
    let brand: BrandSportCar
    static var numberOfSportCars = 0
    init(yearOfManufacture: Int, engineState: EngineState, windowsState: WindowState, brand: BrandSportCar, trunkCapacity: Int) {
        self.brand = brand
        super.init(yearOfManufacture: yearOfManufacture, engineState: engineState, windowsState: windowsState, trunkCapacity: trunkCapacity)
        SportCar.numberOfSportCars += 1
    }
    static func numberOfCarsInfo() {
        print("Выпущено \(self.numberOfSportCars) легковых автомобилей\n")
    }
    override func PrintPropertiesAndStates() {
        print("Легковой автомобиь марки: \(self.brand)\nГод выпуска: \(self.yearOfManufacture)\nОбъем багажника: \(self.trunkCapacity)\nДвигатель: \(self.engineState)\nОкна: \(self.windowsState)\nВ багажник загружено: \(self.loadedVolumeOfTrunk)\n")
    }
}

class TrunkCar: Car {
    let brand: BrandTrunkCar
    static var numberOfTrunkCars = 0
    init(yearOfManufacture: Int, engineState: EngineState, windowsState: WindowState, brand: BrandTrunkCar, trunkCapacity: Int) {
        self.brand = brand
        super.init(yearOfManufacture: yearOfManufacture, engineState: engineState, windowsState: windowsState, trunkCapacity: trunkCapacity)
        TrunkCar.numberOfTrunkCars += 1
    }
    static func numberOfCarsInfo() {
        print("Выпущено \(self.numberOfTrunkCars) грузовиков\n")
    }
    override func PrintPropertiesAndStates() {
        print("Грузовой автомобиь марки: \(self.brand)\nГод выпуска: \(self.yearOfManufacture)\nОбъем кузова: \(self.trunkCapacity)\nДвигатель: \(self.engineState)\nОкна: \(self.windowsState)\nВ кузове загружено: \(self.loadedVolumeOfTrunk)\n")
    }
    //Допустим что при запуске двигателя для грузового автомобиля требуется закрыть окна
    override func StartEngine() {
        super.CloseWindow()
        super.StartEngine()
    }
}


var toyota = SportCar(yearOfManufacture: 2020, engineState: .stopped, windowsState: .closed, brand: .Toyota, trunkCapacity: 200)

var vw = SportCar(yearOfManufacture: 2019, engineState: .stopped, windowsState: .opened, brand: .VolksWagen, trunkCapacity: 150)

var volvoFM4 = TrunkCar(yearOfManufacture: 2010, engineState: .stopped, windowsState: .closed, brand: .Volvo, trunkCapacity: 5000)

var man = TrunkCar(yearOfManufacture: 2017, engineState: .stopped, windowsState: .closed, brand: .Man, trunkCapacity: 4800)

toyota.PrintPropertiesAndStates()
toyota.OpenWindow()
toyota.StartEngine()
toyota.LoadTrunk(volume: 50)

vw.PrintPropertiesAndStates()
vw.StartStopEngine(action: .start)

volvoFM4.PrintPropertiesAndStates()
volvoFM4.UnLoadTrunk(volume: 1000)

man.StartEngine()
man.PrintPropertiesAndStates()

SportCar.numberOfCarsInfo()
TrunkCar.numberOfCarsInfo()
