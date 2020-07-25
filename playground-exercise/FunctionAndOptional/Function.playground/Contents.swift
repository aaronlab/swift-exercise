import UIKit

func printName() {
    print("My name is Aaron.")
}

printName()

func printMultipleOfTen(value: Int) {
    print("\(value * 10)")
}

printMultipleOfTen(value: 5)

func printTotalPrice(_ price: Int, _ count: Int){
    print("Total Price: \(price * count)")
}

//printTotalPrice(price: 2000, count: 3)

printTotalPrice(2000, 3)

func printTotalPriceWithTheDefaultValue(_ price: Int = 2000, _ count: Int = 5){
    print("Total Price: \(price * count)")
}

printTotalPriceWithTheDefaultValue()
printTotalPriceWithTheDefaultValue(500, 3)

func totalPrice(price: Int, count: Int) -> Int {
    return price * count
}

let price = totalPrice(price: 50, count: 10)

var value = 3
func increaseAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}
increaseAndPrint(&value)

func add (_ a: Int, _ b: Int) -> Int {
    return a + b
}

func sub (_ a: Int, _ b: Int) -> Int {
    return a - b
}

func result (_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(function(a, b))
}

result(add, 10, 5)
result(sub, 10, 5)
