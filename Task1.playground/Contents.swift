import UIKit

// Решение квадратного уравнения вида ax2+bx+c=0
let a: Int = 1
let b: Int = 2
let c: Int = -15

if a != 0 {
    let D: Float = Float(b*b-4*a*c)
    if D > 0 {
        //let x1: Float = Float((-b-sqrt(Double(D)))/(2*a))
        print("Дискриминант > 0, значит уравнение имеет 2 корня")
        let x1: Float = Float(-b)-sqrt(D)/(2*Float(a))
        print("x1:",x1)
        let x2: Float = Float(-b)+sqrt(D)/(2*Float(a))
        print("x2:",x2)
    }
    else if D < 0 {
        print("Дискриминант < 0, значит уравнение не имеет коней в действительной области")
    }
    else if D == 0 {
        print("Дискриминант = 0, значит уравнение имеет один корень")
        let x: Float = Float(-b)/(2*Float(a))
        print("x:",x)
    }
}
else {
    print("В квадратном уравнении a не должно быть равным 0")
}
