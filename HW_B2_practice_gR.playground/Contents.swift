import UIKit

// MARK: - function # SC8

/*
 ● Напишите функцию принимающую два параметра: имя и фамилия. Пусть она возвращает полное имя человека
 ● Напишите функцию, которая принимает число и возвращает его квадратный корень
 ● Hапишите функцию, которая принимает число и возвращает его во второй степени
 ● Напишите функцию, принимающую два параметра. Пусть она возвращает сумму квадратного корня первого параметра и второго параметра в
квадрате. Используйте функции, что вы написали выше
 */

func fullName (name: String, surname: String) -> String {
    let nameFull = name + " " + surname
    return nameFull
}
print(fullName(name: "Jim", surname: "Carrey"))


func fullName1 (name: String, secondName: String) -> String {
    return "Полное имя: \(name) \(secondName)"
}
print(fullName1(name: "Bill", secondName: "Gates"))




func sqrtNumber (number: Int) -> Int {
    return Int(pow(Double(number), 0.5))
}
print(sqrtNumber(number: 144))


func sqrtNumber1 (number: Double) -> Double {
    let sqrt1 = sqrt(number)
    return sqrt1
}
print(sqrtNumber1(number: 25))




func powNumber (number: Int) -> Int {
    let pow = Int(pow(Double(number), 2))
    return pow
}
print(powNumber(number: 5))

func powNumber1 (number: Int) -> Int {
    return number * number
}
print(powNumber1(number: 6))




func sumSqrtPow (number1: Int, number2: Int) -> Int {
    let sum = sqrtNumber(number: number1) + sqrtNumber(number: number2)
    let result = powNumber(number: sum)
    return result
}
print(sumSqrtPow(number1: 25, number2: 25))


/*
 ● Создайте цикл от 1 до 10, внутри которого создайте вложенный цикл от 1 до 10. На каждой итерации вложенного цикла вызовите функцию из прошлого задания. В качестве первого параметра передавайте номер итерации внешнего цикла, в качестве второго параметра передавайте номер итерации внутреннего цикла
 
 ● Попробуйте оформить выполненные домашние задания прошлой недели в виде функций
 */

func iterashion (first: Int, second: Int) {
    print("\(first) - \(second)")
}

for outer in 1...10 {
    for inner in 1...10 {
        iterashion(first: outer, second: inner)
    }
}



// MARK: - function # SC9

/*
 ● Напишите функцию, которая принимает несколько параметров, имя человека, его профессию и количество дней отпуска. Пусть функция выводит фразу “Меня зовут ***, я работаю *** и у меня есть *** дней отпуска”
 ● Модифицируйте функцию, добавив значения по умолчанию для профессии и количества дней отпуска. Попробуйте вызвать функцию три раза, каждый раз с разным количеством параметров
 ● Добавьте пустую маску для первого параметра этой функции
 */

func workerName (name: String, profession: String, daysCount: Int) -> String {
    return "Меня зовут - \(name), я работаю - \(profession), и у меня есть - \(daysCount) день отпуска"
}
print(workerName(name: "Bob", profession: "IT", daysCount: 21))


func workerName1 (name: String, profession: String = "unemployed", daysCount: Int = 10) -> String {
    return "Меня зовут \(name), я работаю \(profession) и у меня есть \(daysCount) день отпуска"
}
print(workerName1(name: "Charley", daysCount: 0))
print(workerName1(name: "David", profession: "Builder"))
print(workerName1(name: "Kahn", profession: "Driver", daysCount: 16))


func workerName2 (_ name: String, profession: String = "unemployed", daysCount: Int = 10) -> String {
    return "Меня зовут \(name), я работаю \(profession) и у меня есть \(daysCount) день отпуска"
}
print(workerName2("Alex", profession: "Actor"))


/*
 ● Напишите три функции sum:
    ○ первая принимает два String параметра и выводит строку состоящую из суммы параметров
    ○ вторая принимает два Float параметра и возвращает их сумму
    ○ третья принимает два Int параметра и тоже возвращает их сумму
 ● Создайте по две переменные каждого типа данных: Int, String и Float и протестируйте все три функции
 */

func sum (par1: String, par2: String, par3: String) -> String {
    return par1 + " " + par2 + " " + par3
}
print("Сумма параметров par1, par2 и par3: \(sum(par1: "I", par2: "learn", par3: "programming"))")

func sum1 (_ number1: Float, _ number2: Float) -> Float {
    return number1 + number2
}
print(sum1(3.1, 1.2))

func sum2 (_ number1: Int, _ number2: Int) -> Int {
    return number1 + number2
}
print(sum2(3, 8))


/*
 ● Напишите функцию, принимающую имя человека и замыкание, которое принимает String значение и ничего не возвращает
 ● Вызовите в функции замыкание которое примет имя человека, если в нем есть символы, или строку “Bob”, если имя было пустым. Попробуйте вызвать функцию с разными параметрами
 ● Попробуйте разобрать примеры рекурсии и решить несколько задач и этой статьи: https://habr.com/ru/post/275813/
 */

func nameHuman (name: String, closure: (String) -> () ) {
    closure(name)
}

nameHuman(name: "") { name in
    if name.isEmpty {
        print("Bob")
    } else  {
        print(name)
    }
}

nameHuman(name: "Ron") { name in
    if name.isEmpty {
        print("Bob")
    } else  {
        print(name)
    }
}



// MARK: - guard and switch # SC 10

/*
 ● Создайте переменные типа Int “Проходной бал” и “Мой бал” которые будут содержать значения от 1 до 100. Создайте switch else, который будет проверять, является ли мой балл выше проходного или ниже. В одном случае пусть выводиться сообщение “К сожалению ваш балл ниже проходного”, во втором случае “Поздравляем! Вы поступили!”
 ● Попробуйте реализовать все то же самое, с помощью guard else
 */

var myScore = 78
var passingScore = 50

switch myScore {
case 1...50: print("К сожалению ваш балл ниже проходного")
case 50...100: print("Поздравляем! Вы поступили! Ваш бал \(myScore)")
case 101...1000: print("Такого балла не может быть")
default: print("Нужно сдать экзамены, чтоб поступить")
}

var entered = myScore >= passingScore ? "Поздравляем! Вы поступили! Ваш бал \(myScore)" : "К сожалению ваш балл ниже проходного"
print(entered)

func entered1 (passing: Int) {
guard myScore >= passingScore else {
    print("К сожалению ваш балл ниже проходного")
    return
}
    print("Поздравляем! Вы поступили! Ваш бал \(myScore)")
}

entered1(passing: 50)

/*
 ● Создайте switch case, который будет проверять переменную типа Int, с возможными значениями от 1 до 7. В зависимости от ее значения выведите в консоль день недели
 ● Попрактикуйтесь с использованием выражений fallthrough и where, добавив их в switch case из прошлого задания
 */

func dayOfWeek (dayToday: Int) -> Int {
    return dayToday
}

switch dayOfWeek(dayToday: 2) {
case 1: print("Monday")
case 2: print("Tuesday")
case 3: print("Wednesday")
case 4: print("Thursday")
case 5: print("Friday")
case 6: print("Saturday")
case 7: print("Sunday")
default: "There's no such day"
}

// fallthrough

let allarm: Character = "A"

switch allarm {
case "A":
    print("Выкл все электроприборы")
    fallthrough
case "B":
    print("Закрыть все двери и окна")
    fallthrough
case "C":
    print("Соблюдать спокойствие")
default:
    break
}

// where

let color = "Brown"
let filling = "Chocolate"

switch color {
case "Red" where filling == "Chocolate":
    print("Go to first box")
case "Yelow" where filling == "Nut":
    print("Go to second box")
case "Brown" where filling == "Chocolate",
        "Green" where filling == "Chocolate":
    print("Go to third box")
default:
    break
}



// MARK: - Classes # SC 11

/*
 ● Создайте класс Phone, который содержит переменные number, model и weight
 ● Создайте 2 экземпляра этого класса и выведите в консоль значения их свойств
 ● Добавьте в класс Phone методы:
    ○ receiveCall – имеет один параметр – имя звонящего. Выводит на консоль сообщение “Звонит \(name)”
    ○ getNumber – возвращает номер телефона

 
 Подсказка: используйте convenience init
 ● Добавьте инициализатор в класс Phone, который принимает на вход три параметра для инициализации переменных класса - number, model и weight
 ● Добавьте инициализатор, который принимает на вход два параметра для инициализации переменных класса - number, model.
 ● Добавьте инициализатор без параметров.
 ● Вызовите из инициализатора с двумя параметрами конструктор с тремя.
 */

class Phone {
    var number: Int
    var model: String
    var weight: Int = 0
    
    func receiveCall (nameCalling: String) {
        print("Звонит \(nameCalling)")
    }
    
    func receiveCall2 (nameCalling: String, numberCalling: Int) {
        print("Звонит: \(nameCalling), номер: \(numberCalling)")
    }
    
    func sendMessage (numberPhone: [Int]) {
        print("Messege for: \(numberPhone)")
    }
    
    func getNumber () -> Int{
        return number
    }
    
    init(number: Int, model: String, weight: Int) {
        self.number = number
        self.model = model
        self.weight = weight
    }
    
    convenience init(number: Int, model: String) {
        self.init(number: 0, model: "", weight: 0)
    }
    
//    init(num: Int, mod: String) {
//        number = num
//        model = mod
//    }
    

}

var iPhone1 = Phone(number: 101, model: "")
var iPhone2 = Phone(number: 102, model: "")
iPhone1.model = "iPhoneX"
iPhone1.number = 3806711111123
iPhone1.weight = 112

iPhone1.getNumber()
iPhone1.receiveCall(nameCalling: "Tom")

print("\(iPhone1.number), \(iPhone1.model), \(iPhone1.weight)")

/*
 ● ------- > Добавьте экземпляры класса в массив и вызовите эти методы для каждого из них с помощью цикла
 ● Добавьте в класс метод receiveCall, который принимает два параметра - имя звонящего и номер телефона звонящего. Вызовите этот метод для каждого экземпляра
 ● Создайте метод sendMessage. Он будет принимать на вход номера телефонов, которым будет отправлено сообщение. Метод выводит в консоль номера этих телефонов.
 */

var numberPhoneArray = [380677543124, 380968795613, 380969811451, 380989857411, 380971238743, 380676845501]

var arrayiPhone = [iPhone1, iPhone2]

func getMethods() {
    for method in arrayiPhone {
        print("Methods: \(method.getNumber()), \(method.receiveCall(nameCalling: "Bob"))")
    }
}

iPhone1.receiveCall2(nameCalling: "Sara", numberCalling: 380673411311)
iPhone2.receiveCall2(nameCalling: "Dan", numberCalling: 380963415631)

iPhone1.sendMessage(numberPhone: numberPhoneArray)

getMethods()


// MARK: - Class, struct # SC 12

/*
 ● Создайте класс Calculator, который не содержит свойств, но содержит методы:
    ○ Прибавить - принимает два числа и возвращает их сумму
    ○ Вычесть - принимает два числа и возвращает их разницу
    ○ Умножить - принимает два числа и возвращает результат их умножения
    ○ Разделить - принимает два числа и возвращает результат их деления
    ○ Остаток от деления - принимает два числа и возвращает остаток от деления первого на второе
 */

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
    
    func remainderDivide (number1: Int, number2: Int) -> Int {
        return number1 % number2
    }
}

/*
 ● Создайте класс SuperCalculator. Пусть он будет наследоваться от Calculator и содержать дополнительные методы:
    ○ возвести в степень - принимает два параметра: число и степень в которую его нужно возвести. Возвращает результат возведения числа  в степень
    ○ получить процент - принимает два параметра: число и процент который мы хотим получить. Например число 50 и процент 10. Функция возвращает 5, так как 5 это 10% от 50-ти
 
 ● Переопределите функции описанные в родительском классе, добавьте в каждую из них команду print(“I am SuperCalculator”). Протестируйте эти методы, посмотрите что будет, если не использовать вызов метода родителя через команду super
 ● Создайте экземпляр класса SuperCalculator и протестируйте все методы со своими значениями, выведя результаты в консоль через команду: print(SuperCalculator().myFunc())
 */

class SuperCalculator: Calculator {
    func degree (number: Int, numberDegree: Int) -> Int {
        let pow = Int(pow(Double(number), Double(numberDegree)))
        return pow
    }
    
    func percent (number: Int, getPercent: Int) -> Int {
        return (number * getPercent) / 100
    }
    
    override func plus(number1: Int, number2: Int) -> Int {
        print("SuperCalculator")
        return number1 + number2
    }
    
    override func multiple(number1: Int, number2: Int) -> Int {
        super.multiple(number1: number1, number2: number2)
        print("SuperCalculator")
        return number1 * number2
    }
    
}

let superCalculator = SuperCalculator()

print(superCalculator.plus(number1: 5, number2: 3))
print(superCalculator.minus(number1: 20, number2: 4))
print(superCalculator.multiple(number1: 4, number2: 8))
print(superCalculator.multiple(number1: 3, number2: 7))
print(superCalculator.divide(number1: 50, number2: 10))
print(superCalculator.degree(number: 5, numberDegree: 3))
print(superCalculator.percent(number: 80, getPercent: 43))




/*
 ● Разберите разницу между Reference type и Value type
 ● Разберите механизм Copy on write
 ● Попрактикуйтесь с классами, придумайте и опишите еще 2 примера классов, в которых может присутствовать наследование.
    Пусть в каждом из них будут присутствовать и функции и свойства.
    Классы наследники должны переопределять функции.
 */

class Orange {
    var color = ""
    var taste = ""
    var radius = 0.0
    
    var orangeVolume = 0.0
    
    init () {}
    
    init(color: String, taste: String, radius: Double){
        self.color = color
        self.taste = taste
        self.radius = radius
    }
    func calculate() {
        orangeVolume = 4 / 3 * Double.pi * pow(radius, 3)
        print("Volume orange = \(orangeVolume)")
    }
}

let someOrange = Orange()

someOrange.color = "Orange"
someOrange.taste = "Sweet"
someOrange.radius = 95

print("Orange has \(someOrange.color) color and \(someOrange.taste) taste")

someOrange.calculate()

print(someOrange.orangeVolume)


// Struct

struct Car {
    var name: String
    let productionYear: Int
    var horsePower: Int
}

let honda = Car(name: "Honda", productionYear: 2016, horsePower: 132)
var hondaCivic = honda // Значение структуры при присвоении новой переменной копируется, теперь hondaCivic и honda это 2 независимых экземпляра
hondaCivic.name = "Honda Civic"

for _ in 1...5 {
    hondaCivic.horsePower += 1
}

print("Мощность двигателя \(honda.name) составляет \(honda.horsePower) л.с.")
print("Мощность двигателя \(hondaCivic.name) составляет \(hondaCivic.horsePower) л.с.")

// ----------------->

class Employee {
    var name = ""
    var surname = ""
    var salary = 0
    
    init() {}
    
    init(name: String, surname: String, salary: Int) {
        self.name = name
        self.surname = surname
        self.salary = salary
    }
}

//: 4.2 Создайте массив из 5 объектов под названием `names` со следующими элементами: *John*, *Aaron*, *Tim*, *Ted*, *Steven*. И еще один массив `surnames` с элементами: *Smith*, *Dow*, *Isaacson*, *Pennyworth*, *Jankins*

let names = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins"]

//: 4.3 Объявите массив `employees` и создайте цикл, в котором он заполняется десятью объектами класса `Employee` таким образом, что свойства `name` и `surname` инициализируются случайными именами и фамилиями из массивов `names` и `surnames`, соответственно. Свойство `salary` (зарплата) тоже должно генерироваться в случайном диапазоне от *$1000* до *$2000*

var employees: [Employee] = []

for _ in 1...10 {
    let employee = Employee(
        name: names.randomElement() ?? "",
        surname: surnames.randomElement() ?? "",
        salary: Int.random(in: 1000...2000)
    )
    
    employees.append(employee)
}

//: 4.4 Пройдитесь по массиву `employees` при помощи `for-in` и выведите информацию по каждому объекту в виде: «<имя> <фимилия>’s salary is $<... >»

for employee in employees {
    print("\(employee.name) \(employee.surname)’s salary is \(employee.salary)$")
}

//: 4.5 Создайте отдельный массив на основании `employees`, который включает только тех работников, зарплата которых чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 4.4
// способ 1

var employeesWithEvenSalary: [Employee] = []

for employee in employees {
    if employee.salary.isMultiple(of: 2) {
        employeesWithEvenSalary.append(employee)
    }
}

print("Сотрудники с четной зарплатой")

for employee in employeesWithEvenSalary {
    print("\(employee.name) \(employee.surname)’s salary is \(employee.salary)$")
}

// Способ 2

employeesWithEvenSalary = employees.filter { $0.salary.isMultiple(of: 2) }

print("Сотрудники с четной зарплатой")

for employee in employeesWithEvenSalary {
    print("\(employee.name) \(employee.surname)’s salary is \(employee.salary)$")
}

