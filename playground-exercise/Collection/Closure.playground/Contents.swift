import UIKit

var multiplyClosure: (Int, Int) -> Int = { a, b in
    return a * b
}

multiplyClosure(4, 4)

var addClosure: (Int, Int) -> Int  = {a, b in
    return a + b
}

addClosure(5, 5)

func operateTowNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

operateTowNum(a: 2, b: 3, operation: addClosure)

operateTowNum(a: 5, b: 2, operation: multiplyClosure)

operateTowNum(a: 8, b: 2, operation: { a, b in
    return a / b
})

let voidClosure: () -> Void = {
    print("xcod with swift")
}

voidClosure()

var count = 0
let increamenter = {
    count += 1
}

increamenter()
increamenter()
increamenter()

count
