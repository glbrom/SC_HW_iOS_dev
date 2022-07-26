import UIKit

// MARK: - Классы # 1

/*
 1. Создайте класс Матрос (Sailor), в котором будет инициализатор, одно свойство - имя матроса и один метод "introduceMyself". При вызове этого метода, в консоль будет выводиться сообщение "Привет, меня зовут *имя матроса*!"
 2. Создайте класс Корабль, в котором будет инициализатор, два свойства: название корабля и массив “матросы”. Добавьте также функцию "introduceAll", которая будет выводить приветствие от имени всех матросов, после чего выводить сообщение "Мы с корабля *имя корабля*"
 3. Через инициализатор создайте 5 экземпляров класса Матрос и класс Корабль, в который передайте список созданных матросов. Вызовите функцию introduceAll. Вы должны получить в консоли приветствие от имени всех матросов и название корабля
 */

class Sailor {
    var nameSailor: String
    
    init(name: String) {
        self.nameSailor = name
    }
    
    func introduceMyself () {
        print("Привет, меня зовут \(self.nameSailor)")
    }
}

class Ship {
    
    var nameShip: String
    var sailorArray: [Sailor]
    
    func introduceAll() {
        for i in sailorArray {
            i.introduceMyself()
        }
        print("Мы с корабля \(nameShip)\n")
    }
    
    init(name: String, sailorArray: [Sailor]) {
        self.nameShip = name
        self.sailorArray = sailorArray
    }
}

var sailor1 = Sailor(name: "John")
var sailor2 = Sailor(name: "Ron")
var sailor3 = Sailor(name: "Bob")
var sailor4 = Sailor(name: "Karl")
var sailor5 = Sailor(name: "Dan")

let arraySailor = [sailor1, sailor2, sailor3, sailor4, sailor5]

var costa = Ship(name: "Costa", sailorArray: arraySailor)

costa.introduceAll()



// MARK: - Классы: наследования # 2

/*
 4. Создайте класс Titanic, наследник класса Ship. И класс TitanicSeilor, наследник Seilor. Пусть TitanicSeilor будет иметь ту же функцию introduseMyself, но сообщение будет выводить на английском. Аналогично класс Titanic, только пусть его функция introduceAll выводит на двух языках: то же сообщение что и Ship, а после - такое же сообщение на английском. Не меняйте существующие классы Ship и Seilor
 5. Создайте класс Calculator, с функциями + - * /. Создайте класс CalculatorPro, который будет также вычислять процент от числа и возводить число в степень
 5.1* Создайте класс SuperProCalc, наследник CalculatorPro, который будет вычислять сложные проценты для расчета суммы депозита на указанный период времени с указанной процентной ставкой
 */

// ------------------>

class Titanic: Ship {

    override func introduceAll() {
        super.introduceAll()
        print("We are from the ship \(nameShip)")
    }
}

class TitanicSailor: Sailor {

    override func introduceMyself() {
        print("Hi, my name \(self.nameSailor)")
    }
}

let titanicSailor1 = TitanicSailor(name: "Nik")
let titanicSailor2 = TitanicSailor(name: "Ray")
let titanicSailor3 = TitanicSailor(name: "Mike")
let titanicSailor4 = TitanicSailor(name: "Karl")
let titanicSailor5 = TitanicSailor(name: "Leo")

let arrayTitanic = [titanicSailor1, titanicSailor2, titanicSailor3, titanicSailor4, titanicSailor5]

var titanic = Titanic(name: "Titanic", sailorArray: arrayTitanic)

titanic.introduceAll()

// ------------------>


class Calculator {

    func plus (number1: Int, number2: Int) -> Int {
        return number1 + number2
    }

    func minus (number1: Int, number2: Int) -> Int {
        return number1 - number2
    }

    func multiple (number1: Int, number2: Int) -> Int {
        return number1 * number2
    }

    func divide (number1: Int, number2: Int) -> Int {
        return number1 / number2
    }
}

class CalculatorPro {

    func percent (number: Int, getPercent: Int) -> Int {
        return (number * getPercent) / 100
    }

    func degree (number: Int, numberDegree: Int) -> Int {
        let pow = Int(pow(Double(number), Double(numberDegree)))
        return pow
    }
}

var calculator = Calculator()
var calculatorPro = CalculatorPro()

print(calculator.plus(number1: 8, number2: 3))
print(calculator.minus(number1: 24, number2: 4))
print(calculator.multiple(number1: 13, number2: 5))
print(calculator.divide(number1: 80, number2: 10))
print(calculatorPro.degree(number: 8, numberDegree: 5))
print(calculatorPro.percent(number: 120, getPercent: 50))


class SuperProCalc: CalculatorPro {

    var deposit: Int
    var rate: Int
    var profit: Int
    let period: Int

    func resultDeposit() {
        
        for _ in 1 ... period {
            let one = deposit * rate / 100
            profit += one
            deposit += one
        }
        print("Сумма вклада через \(period) лет увеличивается на \(profit) грн и составит \(deposit) грн")
    }

    init(depo: Int, rate: Int, prof: Int, period: Int) {
        self.deposit = depo
        self.rate = rate
        self.profit = prof
        self.period = period
    }

}

var depositCalculation = SuperProCalc(depo: 100_000, rate: 13, prof: 0, period: 12)

print(depositCalculation.resultDeposit())

// MARK: - Switch # 3

/*
 6. Создайте функцию которая принимает 1 параметр, процент заряда батареи. Пусть функция вернет сообщения для пользователя в зависимости от этого процента:
    ● если 100%: “Устройство заряжено”,
    ● если 70-80%, “Необходимо зарядить устройство в течении 6 часов”
    ● если 20-40%, “Поставьте устройство на зарядку”
    ● если 0%, “Устройство полностью разряжено”
В остальных случаях не выводите ничего. Используйте switch case.
 */

func chargingProgress (percentCharge: Int) -> Int {
    let chargingStatus = percentCharge

    switch chargingStatus {
    case 81...100: print("Устройство заряжено")
    case 70...80: print("Необходимо зарядить устройство в течении 6 часов")
    case 41...69: print("Необходимо зарядить устройство в течении 8 часов")
    case 6...40: print("Поставьте устройство на зарядку")
    case 0...5: print("Устройство полностью разряжено")
    default: if chargingStatus > 100 {
        print("Некорректнное отображение заряда, обратитесь в сервис")
    }
    }
    return chargingStatus
}

print(chargingProgress(percentCharge: 99))
print(chargingProgress(percentCharge: 75))
print(chargingProgress(percentCharge: 21))
print(chargingProgress(percentCharge: 1))

print(chargingProgress(percentCharge: 120))

