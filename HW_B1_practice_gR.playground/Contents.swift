import UIKit
import Foundation



// MARK: - Variables/Const Primitive types: Int, String, Bool # SC2

/* Создайте переменные или константы, в которых можно хранить: ваш возраст, название вашей должности, информацию о том дома вы или нет
● Измените значения:
    ○ возраст - добавить год
    ○ название профессии - добавить перед названием слово “Senior”
    ○ замените свой статус на противоположный

● Выведите в консоль все данные, встроив их в предложение: “Мне *** лет, и я работаю на должности ***” */


/*
var age = 25
var job = "builder"
var atHome = true
var futureJob = "Senior iOS"

age = age + 1
//futureJob = futureJob + " " + job + "!"
//print(futureJob + " " + job)

print("Мне через 1 год будет \(age) лет, и я работаю на должности \(job), но в будущем планирую быть \(futureJob)!")
*/


// MARK: - Typealias, Tuple # SC3

/*
● Создайте переменные типов Int, String, Float и задайте в них цифровые значения
● Создайте переменную “sum” типа Double, в которой будет содержаться сумма всех предыдущих переменных. Используйте приведение типов

Если компилятор просит использовать “!” (Force unwrap), поставьте этот знак
после приведения типа, в следующих уроках мы будем разбирать эту тему

● Создайте по одному Typealias, которые соответствуют типам: String, Int, Float
● Создайте три именованных Tuple с данными:
    ○ Фильм - Название фильма и год его выпуска
    ○ Смартфон - Название смартфона и его цена

    ○ Страна - Название страны и ее столица
● Все типы внутри tuple замените на typalias
● Выведите с помощью команды print:

    ○ Название фильма, Название телефона, Название страны
    ○ Потом пустой print()

    ○ Год выпуска фильма, цена телефона, столица страны */


/*
//var int = 2
//var string = "41"
//var float: Float = 3.131
//
//var sum: Double = 0.0
//
//sum = Double(Float(int) + float + Float(string)!)
//
//print(sum)

typealias string = String
typealias int = Int
typealias float = Float

let film: (name: string, year: int) = ("Calmar game", 2022)
let smartphon: (name: string, price: int) = ("iPhone", 700)
let country: (name: string, capital: string) = ("Ukraine", "Kiev")


print("Название фильма \(film.name), Название телефона \(smartphon.name), Название страны \(country.name).")

print()

print("Год выпуска фильма \(film.year), цена телефона \(smartphon.price), столица страны \(country.capital).")
*/


// MARK: - Array # SC4

/*
 ● Создайте массив включающий имена 5 студентов
 ● Создайте переменные newStudent1, newStudent2 и задайте им имена
 ● Добавьте новых студентов в массив: первого в конец списка, второго в
 начало списка. После этого никаких операций с newStudent1 и newStudent2
 не требуется, продолжаем работу с массивами
 ● Удалите двоих студентов из массива: предпоследнего и первого
 ● Создайте еще один массив с двумя именами
 ● Создайте массив group, который состоит из двух предыдущих массивов

 ● Через команду print() выведите имена студентов:
    ○ первого и последнего
    ○ второго третего
 ● Выведите в консоль сообщения:
    ○ В массиве содержится *** элементов
    ○ Является ли массив пустым: *** (выведите bool значение)
 ● Создайте массив “newGroup”, который содержит всех учеников из group
 ● Очистите массив group
*/


/*
var nameStudents = ["Lili", "Mark", "Bob", "Ron", "Tom"]

var newStudent1 = "Kate"
var newStudent2 = "Tony"

nameStudents.append(newStudent1)
nameStudents.insert(newStudent2, at: 0)

nameStudents.remove(at: 1)
nameStudents.remove(at: 4)

print(nameStudents)

var twoStudents = ["Jon", "Sara"]
var group = [String]()
group = nameStudents + twoStudents

print(group.first as Any? ?? "", group.last ?? "", group[2], group[3])

print("В массиве содержится \(group.count) элементов")

print("Является ли массив пустым \(group.isEmpty)")

var newGroup = group
group.removeAll()

print(group)
print(newGroup)
*/


// MARK: - Dictionary # SC5

/*
● Создайте 3 dictionary, добавьте в каждый не менее трех элементов:
    ○ String: String - Страна: Столица
    ○ String: Int - Город: Почтовый код
    ○ String: Bool - Имя человека: Студент ли он
● Создайте еще одну переменную типа Dictionary, в которую сохраните по
одному элементу из каждого из словарей выше и выведите ее значение в
консоль (На желтые warnings и “optional(...)” значение в консоли мы пока не
обращаем внимания)
● Удалите в первых трех словарях по одному элементу

● Создайте переменные:
    ○ Массив содержащий только ключи из последнего Dictionary
    ○ Массив содержащий только значения из последнего Dictionary
● Выведите в консоль их значения
● Поменяйте местами значение первого и последнего ключа в этом массиве.
Не забывайте что вы всегда можете создавать дополнительные переменные
 */


/*
var country: [String : String] = ["Ukraine" : "Kiev", "Germany" : "Berlin", "Poland" : "Warsawa"]
var postNumber: [String : Int] = ["Kiev" : 01001, "Odessa" : 65125, "Lviv" : 79007]
var isStudent: [String : Bool] = ["Bob" : true, "Lili" : true, "Jon" : false]

var mixDict: [String : Any] = [:]
mixDict["Ukraine"] = country["Ukraine"]
mixDict["Kiev"] = postNumber["Kiev"]
mixDict["Jon"] = isStudent["Jon"]

print(mixDict)

country.removeValue(forKey: "Germany")
postNumber.removeValue(forKey: "Odessa")
isStudent.removeValue(forKey: "Bob")

var keysDict = [isStudent.keys]
var valueDict = [isStudent.values]

print(keysDict)
print(valueDict)
*/


// MARK: - if else # SC6

/*
 ● Создайте шесть констант, содержащих числа Фибоначчи:
    1, 2, 3, 5, 8, 13
 ● Создайте переменные:
    ○ sum - хранит сумму этих констант
    ○ mult - хранит результат умножения этих констант
 ● Уменьшите значение sum на 10, используя один из операторов присваивания
 ● Разделите значение mult на sum используя оператор присваивания
 ● Выведите в консоль разницу mult и sum
 
 ● Создайте переменные типа Int: a, b, c, d. Задайте им случайные значения
 ● Создайте проверки:
    ○ Если a > b, выведите в консоль “1”
    ○ Если a < b, выведите в консоль “2”
    ○ В остальных случаях выведите “3”
 ● Если выполнено первое условие, добавьте в него вложенные проверки:
    ○ Если сумма a и b меньше с, выведите в консоль “4”
    ○ В другом случае если разница a и b больше с, выведите в консоль “5”
 
 ● Если выполнено второе условие, добавьте в него вложенные проверки:
    ○ Если a или b меньше с, выведите в консоль “6”
    ○ В обратном случае если и a и с больше d, а так же d больше b , выведите в консоль “7”
● Если сработает вариант “для всех остальных случаев”, добавьте вложенну проверку:
    ○ Если a не больше нуля, выведите в консоль “8”
*/


/*
let oneFibo = 1
let twoFibo = 2
let threeFibo = 3
let fiveFibo = 5
let eightFibo = 8
let thirteenFibo = 13

var sum = 0
var multi = 0

sum = oneFibo + twoFibo + threeFibo + fiveFibo + eightFibo + thirteenFibo
multi = oneFibo * twoFibo * threeFibo * fiveFibo * eightFibo * thirteenFibo

sum -= 10

multi /= sum

print(multi - sum)
*/


/*
var a = 3
var b = 5
var c = 15
var d = 41

if a > b {
    print("1")
    if a + b < c { print("4") } else if a - b > c { print("5") }
} else if a < b {
    print("2")
    if a < c && b < c { print("6") } else if a > c && c > d && d > b { print("7") }
} else {
    print("3")
    if !(a > 0) { print("8") }
}
*/


// MARK: - for and while loop # SC7

/*
● Создайте массив weekDays с рабочими днями недели
● Пройдите по нему в цикле for in и выведите каждый день в консоль
● Модифицируйте цикл, чтобы вывести в консоль сообщение:
*порядковый номер* - *название* дня недели
● Модифицируйте цикл, добавив условие, чтобы цикл выполнялся только для первых трех элементов

● Создайте массив на 10 элементов с числами (возраст ваших знакомых).
● Добавьте цикл for in который пройдется по этим элементам и выведет в
консоль сообщение “Мне *** лет”
● После чего добавьте проверку, младше 18 лет или старше. В первом
случае выводим сообщение: “Ребенок”, во втором: “Взрослый”.
● Для всех, кто младше 18 лет, измените сообщение “Ребенок” на “Я уже
отпраздновал: ”. После чего запустите вложенный цикл, который пройдется по количеству лет человека и выведет нa каждой итерации *** лет. Например: “Я уже отпраздновал: ... 5 лет ⏎ 6 лет ⏎ 7 лет ...”
*/


/*
var weekDays = ["Monday", "Tuesday", "Wendsday", "Thirsday", "Friday", "Saturday", "Sunday"]

for (index, day) in weekDays.enumerated() {
    if index <= 2 {
        print(index)
        print(day)
    }
}
 */


/*
var age = [37, 28, 52, 7, 14, 25, 31, 20, 15, 33, 45, 83, 62, 11]

for year in age {
    print("Мне \(year) лет")

    if year > 18 {
        print("Взрослый")
    } else {
        print("Я уже отпраздновал: \(year) лет")
        for i in 1 ... year {
            print("\(i) лет")
        }
    }
}
*/


