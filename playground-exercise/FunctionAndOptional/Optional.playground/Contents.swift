import UIKit

var carName: String?

var name: String? = nil //  optional
let num = Int("10")

//carName = "My Car"

// Forced Unwrapping
// Optional Binding (if let)
// Optional Binding (guard)
// Nil Coalescing

//print(carName!) // extract the value

//carName = nil
//print(carName!)   // err

if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("No Car")
}

//func printParsedInt(from: String) {
//    if let parsedInt: Int = Int(from) {
//        print(parsedInt)
//    } else {
//        print("can't covert to an Int")
//    }
//}

func printParsedInt(from: String) {
    guard let parsedInt = Int(from) else {
        print("can't conver to an Int")
        return
    }
    print(parsedInt)
}

printParsedInt(from: "100")
printParsedInt(from: "Hi")

let myCarName: String = carName ?? "Model S"    // default = Model S

var favFood: String? = "my fav food"

func myFood(from: String?) {
    guard let food = from else {
        print("nothing")
        return
    }
    print(food)
}

myFood(from: favFood)

if let food = favFood {
    print(food)
} else {
    print("nothing")
}
