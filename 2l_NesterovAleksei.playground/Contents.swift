import Foundation

func isEven(_ arg: Int) -> Bool
{
    return arg%2 == 0 ? true : false
}

func isDividedBy3(_ arg: Int) -> Bool
{
    return arg%3 == 0 ? true : false
}

func getArray(_ numOfElem: Int) -> [Int]
{
    var newArray: [Int] = []
    for i in 0...99{
        newArray.append(i)
    }
    return newArray
}

func getModifiedArray(_ argArray: [Int]) -> [Int]{
    var newArray = argArray
    for curElem in newArray{
        if isEven(curElem) || !isDividedBy3(curElem) {
            newArray.remove(at: newArray.firstIndex(of: curElem)!)
        }
    }
    return newArray
}

func addFibonachiNumber(_ argArray: [UInt64]) -> [UInt64]{
    var newArray = argArray
    let lengthOfArray = newArray.count
    if lengthOfArray == 0 {
        newArray.append(UInt64(0))
    } else if lengthOfArray == 1 {
        newArray.append(UInt64(1))
    } else {
        newArray.append(UInt64(newArray[lengthOfArray-1] + newArray[lengthOfArray-2]))
    }
    return newArray
}

func addOneHundredFibonachiNumbers() -> [UInt64]{
    var arrayOfFibonachiNumbers: [UInt64] = []
    for _ in 0...93{
        arrayOfFibonachiNumbers = addFibonachiNumber(arrayOfFibonachiNumbers)
    }
    return arrayOfFibonachiNumbers
}

print("Четное число - \(isEven(4))\n")
print("Число делится на 3 - \(isDividedBy3(4))\n")
print("Массив 100 чисел - \(getArray(100))\n")
print("Массив без четных чисел и чисел которые не делятся на 3 - \(getModifiedArray(getArray(100)))\n")
print("Получить массив из 94 чисел Фибоначи - \(addOneHundredFibonachiNumbers())\n") //больше 94 не получается...
