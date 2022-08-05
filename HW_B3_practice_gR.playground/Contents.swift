import UIKit
import Foundation

// MARK: - Optionals "! if guard switch Optional chainin" # SC13

// ● Создайте опциональные переменные типов String, Int, Bool, Float. Разверните (unwrap) их разными способами

// Forced unwrapping !
var someStringForce: String?
someStringForce = "Force unwrapping"
print(someStringForce!)
// Если значения нету и мы попытаемся извлечь строку, которая не существует, будет crash



// Optional binding if while guard
var someString: String?
if let unwrappedString = someString {
    print("unwrappedString = \(unwrappedString)")
} else {
    print("No value unwrappedString")
}

someString = "String optional binding"
if let unwrappedString = someString {
    print("unwrappedString = \(unwrappedString)")
} else {
    print("No value unwrappedString")
}

// guard
var someInt: Int?
func unwrapInt() {
    guard let unwrapSomeInt = someInt else {
        return
    }
    print(unwrapSomeInt)
}



// Implicitly unwrapped при обьявлении указываем !, когда мы точно значем что при обращении к переменной значение будет установленно 100%
var surveyAnswer: String!
surveyAnswer = "Answer"
let anotherAnswer: String = surveyAnswer
print(anotherAnswer)



// nil-coalesing ??
var someBool: Bool?
var coalesingBool: Bool = someBool ?? true
 print(coalesingBool)
someBool = false
print("Value someBool = \(someBool ?? true)")



// switch
var someFloat: Float?

switch someFloat {
case .some(let value):
    print(value)
case .none:
    print("No value float")
}



// Optional chainin Опциональные цепочки
struct Programmer {
    var name: String
    var it: IT?
    
    func printInfo() {
        print("Name is \(name), company is \(it?.nameCompany ?? "none")")
    }
}

struct IT {
    var nameCompany: String
}

var programmers = [Programmer]()

var name = programmers.first?.name
programmers.first?.printInfo()
programmers.append(.init(name: "Kim", it: nil))
name = programmers.first?.name
programmers.first?.printInfo()
programmers.append(.init(name: "Ron", it: .init(nameCompany: "Epam")))
programmers.last?.printInfo()


/* ● Создайте класс А, у которого будет опциональное свойство класса B. Пусть у класса B будет свойство “text” типа String. Создайте экземпляр класса B, задайте его свойству text значение. Создайте класс A и задайте его свойству значение только что созданного класса B
 ● Выведите в консоль значение text. Значение в консоли будет помечено как “optional”
 ● Разверните значение text разными способами и выведите в консоль (на этот раз пометка “optional” должна исчезнуть)
*/

class B {
    var text: String

    init(text: String) {
        self.text = text
    }
}

var someB = B(text: "BMW")

class A {
    var valueB: B?
}

var someA = A()

someA.valueB?.text
someB.text

if let unwrappedSomeValueB = someA.valueB?.text {
    print("unwrappedSomeValueB = \(unwrappedSomeValueB)")
} else {
    print("No value unwrappedSomeValueB")
}

print(someA.valueB?.text ?? "No SomeA text")



// MARK: - Protocol for class struct # SC14
// read only - get, write - set
// No optional methods or properties for Protocol
// able в конце name protocol Movable - mov + able

/*
 ● Создайте протокол Movable, в котором будет метод run(), протокол Fightable с методом fight()
 ● Создайте протокол Hero, который включает оба протокола и свойство name
 ● Создайте не менее двух персонажей для игры на каждый протокол из трех описанных выше. Например struct Farmer: Movable { ... }, struct Butcher: Fightable и т.д. Реализуйте методы в зависимости от структуры которую вы используете. В нашем примере в реализации метода run() у структуры Farmer мы можем вывести print(“Farmer: Run”), в методе fight() у Butcher можем вывести print(“Butcher: fight”)
 */

protocol Movable {
    func run()
}

protocol Fightable {
    func fight()
}

protocol Hero: Movable, Fightable {
    var name: String { get set }
}

struct Builder: Movable {
    func run() {
        print("Builder bring me a hammer, if go run :)")
    }
}

struct Runner: Movable {
    func run() {
        print("Runner welcom to Marathon")
    }
}

struct Boxer: Fightable {
    func fight() {
        print("Fight tonight WBO")
    }
}

struct Wrestler: Fightable {
    func fight() {
        print("Competitions per week")
    }
}

struct UFC: Hero {
    var name: String
    
    func run() {
        print("Run ufc run")
    }
    
    func fight() {
        print("UFC wait for you")
    }
}

struct Boxing: Hero {
    var name: String
    
    func run() {
        print("Run boxing run")    }
    
    func fight() {
        print("WBO wait for you")
    }
}



/*
 ● Создайте класс Tavern (таверна). У нее должен быть массив всех юнитов в таверне, которые умеют сражаться: var fighters: [Fightable] = [], и аналогичный массив movers, принимающий объекты что могут двигаться.
 Также в таверне будет метод enterTavern(hero: Hero)
 ● В реализации этого метода будет:
    ○ вызываться метод fight у Hero
    ○ выполняться цикл for по массиву movers, у каждого элемента будет вызываться метод run
    ○ аналогично с предыдущим пунктом, только у fighters метод fight()
 */

class Tavern {
    var fighters: [Fightable] = []
    var movers: [Movable] = []
    
    func enterTavern(hero: Hero) {
        hero.fight()
        for mover in movers {
            mover.run()
        }
        
        hero.fight()
        for fighter in fighters {
            fighter.fight()
        }
    }
}



/*
 ● Время протестировать все созданные типы и протоколы. Создайте экземпляры всех типов: по 2 персонажа для Movable, Fightable и Hero.
    Пример: var alice = Fermer() ... Создайте экземпляр таверны.
 ● Присвойте свойствам таверны значения: в массив movers передайте экземпляры что могут двигаться, в массив fighters тех кто могут сражаться
 ● Обратитесь к таверне и вызовите метод enterTavern для двух экземпляров соответствующих протоколу Hero
 ● В итоге в консоли должно пройти текстовое сражение, вывод имени героя, посетившего таверну и начавшего сражение, после имена тех кто разбегаются, после имена тех кто сражается
 */

var bob = Builder()
var kahn = Runner()

var vitaliy = Boxer()
var mcgregor = Wrestler()

var ufc = UFC(name: "Habib")
var boxing = Boxing(name: "Roy Jons")


var taverna = Tavern()
taverna.movers = [bob, kahn]
taverna.fighters = [vitaliy, mcgregor]

taverna.enterTavern(hero: ufc)
taverna.enterTavern(hero: boxing)



/*
 ● Придумайте другую игру, уже не о диком западе. В ней должны присутствовать все те же примеры классов / структур работающих с типами на основании протокола, на который подписан тип
 ● Практикуйтесь с примерами, пока не почувствуете, что схемa использования протоколов вам полностью ясна :)
 */

protocol SwiftProtocol {
    var property: String { get set }
}

struct SwiftStruct: SwiftProtocol {
    var property: String
}

class Container {
    var protocolInstance: SwiftProtocol
    
    init(instance: SwiftProtocol) {
        protocolInstance = instance
    }
}

let container = Container(instance: SwiftStruct(property: "Struct with SwiftProtocol"))
let value = container.protocolInstance.property




// MARK: - Extensions # SC15

/*
 ●  Напишите расширение “square” на Int, позволяющее возводить число в квадрат
 ●  Напишите расширение на String, которое позволит из текста вернуть:
    ○ Первое слово
    ○ Первую часть предложения до запятой
    ○ Первое предложение
    ○ Предложение с восклицательным знаком
 */

extension Int {
    var square: Int { return self * self }

  func sqrt(value: Int) -> Int {
    var tempValue = self
    for _ in 1..<value {
        tempValue *= self
    }
    return tempValue
  }
}

// Возведение в квадрат
let doubleSqrt = 7.square

// Возведение в степень
let sqrt = 5.square
print(sqrt)


extension String {
    var firstWord: String { return self.components(separatedBy: " ").first ?? "No first word" }
    var firstPartSuggestionComma: String { return self.components(separatedBy: ", ").first ?? "There is no comma in this sentence" }
    var firstSuggestion: String { return self.components(separatedBy: ".").first ?? "No first suggestion" }
//    var exclamationMark: String { return self.components(separatedBy: " !").first ?? "No sentence with exclamation mark" }
}

let str1 = "I try learn"
print(str1.firstWord)

let str2 = "I try learn swift, iOS"
print(str2.firstPartSuggestionComma)

let str3 = "I try learn programming. I hope everything will work out"
print(str3.firstSuggestion)

//let str4 = "I try learn programming. I hope everything will work out!"
//print(str4.exclamationMark)




/*
 Создайте протокол Runnable с функцией run, Flyable с функцией fly, Alive с функциями
 breath, eat и grow. В каждой функции пусть будет print с выводом в консоль названия
 функции.
 
 ● Создайте расширение на Alive, с дефолтной реализацией функций breathe, eat. В этой реализации должно выводиться сообщение в консоль “breathe” / “eat”
 ● Создайте 6 персонажей для вашей игры с помощью структур, каждый из них должен соответствовать как минимум одному протоколу
 ● Добавьте дефолтную реализацию для всех протоколов (в ней будет вывод сообщения с названием функции через команду print())
 ● В половине созданных структур реализуйте методы протокола, в которых будет выводиться название функции и название структуры, например print(“Iron man - Fly”)
 */

protocol Runnable {
    func run()
}

extension Runnable {
    func run() { print("run") }
}

protocol Flyable {
    func fly()
}

extension Flyable {
    func fly() {
        print("fly")
    }
}

protocol Alivable {
    func breath()
    func eat()
    func grow()
}

extension Alivable {
    func breath() { print("breathe") }
    func eat() { print("eat") }
    func grow() { print("grow") }
}

struct IronMan: Flyable {
    var name: String
    func fly() {
        print("\(name) - Fly")
    }

}

struct CapitanAmerica: Runnable {

}

struct Tor: Alivable {

}

struct SpiderMan: Flyable, Runnable {

}

struct Halk: Alivable, Runnable {
    var name: String
    mutating func run() {
        print("\(name) - Run")
    }
}

struct BatMan: Flyable, Alivable {

}

var capitanAmerica = CapitanAmerica()
capitanAmerica.run()

var halk = Halk(name: "Hulk")
halk.run()




// MARK: - Generics # SC16

//  ● Функцию, принимающую два параметра и меняющую местами их значения

var x = "Y"
var y = "X"

func reversed<T>(x: inout T, y: inout T) {
    let result = x
    x = y
    y = result
}

print("x: \(x), y: \(y)")
reversed(x: &x, y: &y)
print("x: \(x), y: \(y)")



// ● Функцию, принимающую два параметра и возвращающую typle с ними же

func twoGenerTyple<T>(first: T, second: T) -> (T, T) {
    return (first, second)
}

twoGenerTyple(first: x, second: y)



// ● Функцию сложения, которая принимает два параметра и возвращает их сумму

func summa<T: Numeric>(first: T, second: T) -> T {
    return (first + second)
}

summa(first: 10, second: 4)



// ● Тип, который содержит свойство - Dictionary с данными. Напишите функции, которые добавляют в этот словарь значение по ключу и достают значение по ключу

struct DictionaryType<Key: Hashable, Value> {
    var dict = [Key : Value]()
    
    mutating func addValue(key: Key, value: Value) {
        return dict[key] = value
    }
    mutating func getValue(key: Key) -> Value? {
        return  dict[key]
    }
}




