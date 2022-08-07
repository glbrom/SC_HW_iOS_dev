import UIKit
import Foundation


// MARK: - Optionals, Protocols # 1

/*
 1. Откройте презентацию по протоколам, в конце вы найдете блок с практикой. Выполните практику, создав простую игровую ситуацию с помощью протоколов
 
 2. Лучший способ закрепить информацию, придумать свой способ применения протоколов. Откройте последний слайд практики по протоколам, и выполните задание. Необходимо создать свою мини игру, где вы могли бы использовать протоколы, но будет минимальный набор требований:

 ○ Должны быть функции, возвращающие опциональные значения
 ○ Эти функции должны вызываться и опционалы должны быть “развернуты”
 ○ Перенесите эту игру в XCode проект

 Организуйте красивую файловую структуру, разные типы в разные файлы. Используйте папки.
 Этот проект мы будем загружать на github в качестве домашнего задания в следующем блоке
 */


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






// MARK: - Protocols, Extensions # 2

/*
 3. Напишите расширения на следующие типы:
    ○ Int - Функция возводит число в N-ую степень. Попробуйте решить задачу без использования стандартной функции pow(), решите ее с использованием циклов
 
 // Напишите расширение “square” на Int, позволяющее возводить число в квадрат
 */

extension Int {
    var square: Int { return self * self }  // Напишите расширение “square” на Int, позволяющее возводить число в квадрат

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


// ○ String - Вычисляемое свойство isPalindrome. Возвращает Bool, в зависимости от того является ли строка палиндромом

extension String {
    func isPalindrome(check: String) -> Bool {
        let lowercased = check.lowercased()
        return String(lowercased.reversed()) == lowercased
    }
}

var example = ""
var palindrome1 = "Лёша на полке клопа нашёл"
var palindrome2 = "Лёшанаполкеклопанашёл"

example.isPalindrome(check: palindrome1)
example.isPalindrome(check: palindrome2)


/*
 4. Вернитесь к созданной вами игре во втором задании и добавьте для всех протоколов реализацию методов по умолчанию
 */


extension Movable {
    func run(){ print("Run") }
}

extension Fightable {
    func fight(){ print("Fight") }
}




// MARK: - Generics # 3

/*
 Откройте презентацию по Generics, в конце презентации вы найдете практику

 5. Выполните практику на первом слайде.
 6. Выполните практику второго слайда. Здесь вы можете реализовать либо стек, либо
 связанный список (stack / linked list)
*/


//  ● Функцию, принимающую два параметра и меняющую местами их значения

var x = "Y"
var y = "X"

func reversed<T>(_ first: inout T, _ second: inout T) {
    let result = first
    first = second
    second = result
}

print("x: \(x), y: \(y)")
reversed(&x, &y)
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



/*
 Реализация стек (stack) # 1
 */

struct Stack<Element> {
    var values: [Element]
    
    mutating func push (_ element: Element) {
        values.append(element)
    }
    
    mutating func pop() -> Element? {
        guard !values.isEmpty else { return nil }
        return values.removeLast()
    }
}

extension Stack where Element: Collection {
    var elementCountLast: Int {
        return values.last?.count ?? 0
    }
}



var stack = Stack(values: ["BMW", "Audi", "Mercedes", "VW"])

stack.values
stack.pop()
stack.values
stack.push("Toyota")
stack.values

stack.elementCountLast



/*
 Реализация стек (stack) # 2
 */

class Node<T> {
    let value: T
    var next: Node?
    init(value: T) {
        self.value = value
    }
}

class StackClass<T> {
    var top: Node<T>?
    
    func push(_ value: T) {
        let oldTop = top
        top = Node(value: value)
        top?.next = oldTop
    }
    
    func pop() -> T? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    func peek() -> T? {
        return top?.value
    }
}

struct User {
    let name: String
    let username: String
}

let one = User(name: "Ron", username: "ron1234")
let two = User(name: "Bob", username: "bob.user")

let usersStackClass = StackClass<User>()
usersStackClass.push(one)
usersStackClass.push(two)

let firstUserPop = usersStackClass.pop()
print(firstUserPop?.name ?? "")

let stackClass = StackClass<Int>()
stackClass.push(1)
stackClass.push(2)
stackClass.push(3)

stackClass.peek()

let firstPop = stackClass.pop()
stackClass.peek()
let secondPop = stackClass.pop()
let thirdPop = stackClass.pop()
let finalPop = stackClass.pop()



/*
 Связанный список (linked list)
 */

//                head    <-             <-             <-   end/tail
//linkedList: [element 1] -> [element 2] -> [element 3] -> [element 4] -> nil

//index            0          1          2          3          4          5
//array:      [element 1][element 2][element 3][element 4][element 5][element 6]...

//Algorithm           ArrayList   LinkedList
//seek front            O(1)         O(1)
//seek back             O(1)         O(1)
//seek to index         O(1)         O(N)
//insert at front       O(N)         O(1)
//insert at back        O(1)         O(1)
//insert after an item  O(N)         O(1)

struct LinkedList<T> {
    var head: LinkedListNode<T>
    
    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>)
    case end
}


let element4 = LinkedListNode.value(element: "D", next: .end)
let element3 = LinkedListNode.value(element: "C", next: element4)
let element2 = LinkedListNode.value(element: "B", next: element3)
let element1 = LinkedListNode.value(element: "A", next: element2)
let list = LinkedList(head: element1)


extension LinkedList: Sequence {
    
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    
    var current: LinkedListNode<T>
    
    mutating func next() -> T? {
        switch current {
        case let .value(element, next):
            current = next
            return element
        case .end: return nil
        }
    }
}

list.contains("R")
list.contains("B")

for element in list {
    print(element)
}
