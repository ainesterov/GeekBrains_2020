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

struct SportCar {
    let brand: BrandSportCar
    let yearOfManufacture: Int
    let trunkCapacity: Int
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
    
    mutating func StartEngine() {
        self .engineState = .started
    }
    
    mutating func StopEngine() {
        self .engineState = .stopped
    }
    
    mutating func OpenWindow() {
        self .windowsState = .opened
    }
    
    mutating func CloseWindow() {
        self .windowsState = .closed
    }
    
    mutating func LoadTrunk(volume: Int) {
        if self.loadedVolumeOfTrunk + volume <= self.trunkCapacity {
            self .loadedVolumeOfTrunk += volume } else {
            print("Невозможно загрузить багаж! Превышение объема!!!\n")
        }
    }
    mutating func UnLoadTrunk(volume: Int) {
        if self.loadedVolumeOfTrunk >= volume {
            self .loadedVolumeOfTrunk -= volume } else {
            print("Невозможно выгрузить больше, чем загружено!!!\n")
        }
    }
    mutating func StartStopEngine(action: EngineActions) {
        switch action {
        case .start:
            self.engineState = .started
        case .stop:
            self.engineState = .stopped
        }
    }
    
    func PrintPropertiesAndStates() {
        print("Легковой автомобиь марки: \(self.brand)\nГод выпуска: \(self.yearOfManufacture)\nОбъем багажника: \(self.trunkCapacity)\nДвигатель: \(self.engineState)\nОкна: \(self.windowsState)\nВ багажник загружено: \(self.loadedVolumeOfTrunk)\n")
    }
}

// Описание структуры грузового автомобиля
struct TrunkCar {
    let brand: BrandTrunkCar
    let yearOfManufacture: Int
    let trunkCapacity: Int
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
            print("В кузове загружено: \(self.loadedVolumeOfTrunk)\n")
        }
    }
    
    mutating func StartEngine() {
        self .engineState = .started
    }
    
    mutating func StopEngine() {
        self .engineState = .stopped
    }
    
    mutating func OpenWindow() {
        self .windowsState = .opened
    }
    
    mutating func CloseWindow() {
        self .windowsState = .closed
    }
    
    mutating func LoadTrunk(volume: Int) {
        if self.loadedVolumeOfTrunk + volume <= self.trunkCapacity {
            self .loadedVolumeOfTrunk += volume } else {
            print("Невозможно загрузить груз! Превышение объема!!!\n")
        }
    }
    mutating func UnLoadTrunk(volume: Int) {
        if self.loadedVolumeOfTrunk >= volume {
            self .loadedVolumeOfTrunk -= volume } else {
            print("Невозможно выгрузить больше, чем загружено!!!\n")
        }
    }
    mutating func StartStopEngine(action: EngineActions) {
        switch action {
        case .start:
            self.engineState = .started
        case .stop:
            self.engineState = .stopped
        }
    }
    
    func PrintPropertiesAndStates() {
        print("Грузовой автомобиь марки: \(self.brand)\nГод выпуска: \(self.yearOfManufacture)\nОбъем кузова: \(self.trunkCapacity)\nДвигатель: \(self.engineState)\nОкна: \(self.windowsState)\nВ кузове загружено: \(self.loadedVolumeOfTrunk)\n")
    }
}



var toyota = SportCar(brand: .Toyota, yearOfManufacture: 2020, trunkCapacity: 200, engineState: .stopped, windowsState: .closed, loadedVolumeOfTrunk: 0)

var vw = SportCar(brand: .VolksWagen, yearOfManufacture: 2019, trunkCapacity: 150, engineState: .stopped, windowsState: .opened, loadedVolumeOfTrunk: 20)

var volvoFM4 = TrunkCar(brand: .Volvo, yearOfManufacture: 2010, trunkCapacity: 5000, engineState: .started, windowsState: .closed, loadedVolumeOfTrunk: 2800)

var man = TrunkCar(brand: .Man, yearOfManufacture: 2017, trunkCapacity: 4800, engineState: .started, windowsState: .opened, loadedVolumeOfTrunk: 2000)


toyota.PrintPropertiesAndStates()
toyota.OpenWindow()
toyota.StartEngine()
toyota.LoadTrunk(volume: 50)

vw.PrintPropertiesAndStates()
vw.StartStopEngine(action: .start)

volvoFM4.PrintPropertiesAndStates()
volvoFM4.UnLoadTrunk(volume: 1000)

man.StopEngine()
man.PrintPropertiesAndStates()
