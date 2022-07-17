import UIKit
import Foundation
 
// MARK: - Массивы и циклы # 1

/*
Создайте массив с десятью случайными числами, из которых пять меньше нуля и пять больше нуля
    1. Замените все отрицательные числа на 0 и выведите массив в консоль
    2. Найдите минимальный и максимальный элемент в массиве и выведите его в консоль
    3. Найдите сумму элементов массива чисел и выведите ее в консоль
*/

var randomNumber = [-3, 4, -14, 8, 32, -5, 21, -23, 53, -11]

for numberMinusReplace in randomNumber where numberMinusReplace < 0 {
    print(numberMinusReplace)
}
print("minus number replace: \(randomNumber.map { $0 < 0 ? 0 : $0 })")

print("min array: \(randomNumber.min()!), max array: \(randomNumber.max()!)")

print("sum array: \(randomNumber.reduce(0) { $0 + $1 })")


// MARK: - Массивы, словари и циклы # 2

/*
    4. Создайте массив с названиями всех месяцев, типа String. Затем создайте словарь и с помощью цикла задайте ему значения на основании массива: где в качестве ключей будут выступать цифры (индексы), а в качестве значений - элементы массива.
    5. Создайте словарь:
var dictionary = ["first": 1, "second": 2, "third": 3, "fourth": 4]
Поменяйте местами значения по ключам “first” и “fourth”. Выведите в консоль итоговый словарь
 */

var monthArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

var monthDic = [Int : String]()

//for (index, value) in month.enumerated() {
//    monthDic = [index : value]
//    print(monthDic)
//}

monthArray.enumerated().forEach { i, month in
    monthDic[i] = month
}
print(monthDic)

var dictionary = ["first": 1, "second": 2, "third": 3, "fourth": 4]

var first = dictionary["first"]
dictionary["first"] = dictionary["fourth"]
dictionary["fourth"] = first
print(dictionary)


// MARK: - Словари и циклы # 3

/*
    6. Создайте пустой словарь calendar, так же вам понадобиться массив с месяцами из четвертого задания.
 С помощью цикла от 1970 до 2022 задайте значения для словаря. В
 качестве ключа пусть будет год, а значение это массив с месяцами.
    7. С помощью другого цикла добавьте в calendar на каждый год по одному месяцу с вашим названием, чтобы в каждом году вышло 13 месяцев.
 */

var calendar = [Int : Array<String>]()

    for year in 2020...2022 {
        calendar[year] = monthArray
}

    for  addMonth in calendar.keys {
    calendar[addMonth]!.append("Thirteen")
}

print(calendar)


// MARK: - Словари и циклы * # 4

/*
    7.1 На основании словаря, который у вас получился в седьмом задании, давайте создадим новый словарь, который будет включать в себя также и даты, a именно массив с числами от 1 до 31:
            ● Создайте массив с числами от 1 до 31 с помощью цикла.
            ● Создайте новый словарь calendarPro, где в качестве ключей будут года, в качестве значений вложенные словари. В которых в качестве ключей названия месяцев, а в качестве значений массив с днями созданный выше.
            ● Выведите в консоль 1 сентября 2019 года.

 PS: Для заполнения calendarPro используйте только созданный массив с
 числами, и словарь с месяцами, и никаких других данных
*/

var dateArray: [Int] = []

for i in 1...31 {
    dateArray.append(i)
}

print(dateArray)

var calendarPro: Dictionary<Int, Dictionary<String, Array<Int>>> = [:]

var monthDateDict: [String : Array<Int>] = [:]

for value in monthArray {
    monthDateDict.updateValue(dateArray, forKey: value)
}

for year in 2015...2020 {
    calendarPro[year] = monthDateDict
}
print(calendarPro)

print("2019 1 September")

print(calendarPro[2019]!["September"]![0])

// MARK: - Условные операторы и Примитивные типы данных * # 5

/*
    8. Создайте 2 переменные с числами. Если значения равны, выведите в консоль их сумму умноженную на 3, если нет, выведите в консоль их сумму в случае если она четное число.
    9. Создайте строку, в которой будет храниться любая фраза из трех или более слов c восклицательным знаком в конце. Выведите в консоль первое и последнее слово из этой строки (без восклицательного знака).
 В этом задании необходимо найти способ доставать слова из вашей строки,
 погуглите методы с помощью которых это возможно реализовать. Задание сложнее чем кажется :)
*/

var oneNumber = 10
var secondNumber = 3
let sum = oneNumber + secondNumber

if oneNumber == secondNumber {
    print(sum * 3)
} else if sum.isMultiple(of: 2) {
    print(sum)
}



var tryLearn = "I try learn swift!"
let words = tryLearn.split(separator: " ")
print("Первое слово строки: \(words.first!). Последнее слово строки: \(words.last?.dropLast(1) ?? "")")



let tryDoIt = "I need help with 7.1 task!"
var arrayString = tryDoIt.components(separatedBy: " ")
let lastWord = arrayString.last!.components(separatedBy: "!")
print("Первое слово строки: \(arrayString.first!). Последнее слово строки: \(lastWord.first!)")
