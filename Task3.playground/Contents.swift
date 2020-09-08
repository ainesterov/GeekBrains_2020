import UIKit
//расчет суммы процентов по вкладу
let deposit: Float = 50000
let InterestRate: Float = 12.5
var TotalSum: Float = deposit

for i in 1...5 {
    TotalSum = TotalSum * (1 + InterestRate / 100)
}
print("Сумма по вкладу с учетом начисленных процентов на конец 5 года составит: ", TotalSum)
