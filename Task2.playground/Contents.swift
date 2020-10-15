import UIKit
//Вычислить площадь, периметр и гипотенузу прямоугольного треугольника
//катеты a и b, гипотенуза с
let a: Int = 3
let b: Int = 4

let c: Float = Float(sqrt(Double(a*a+b*b)))
print("Гипотенуза с - ", c)

let perimeter: Float = Float(a)+Float(b)+c
print("Периметр - ", perimeter)

let square: Float = Float(a)*Float(b)/2
print("Площадь - ", square)

