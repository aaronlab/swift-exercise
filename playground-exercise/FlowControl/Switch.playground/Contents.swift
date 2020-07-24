import UIKit

//let num = 10
//
//switch num {
//case 0...2:
//    print("0~2")
//case 10:
//    print("10")
//default:
//    print("not 0 or 10")
//}
//
//let pet = "cat"
//
//switch pet {
//case "puppy", "cat":
//    print("what a small pet")
//case "cow":
//    print("cow")
//default:
//    print("dunno")
//}

let num = 5
switch num {
case _ where num % 2 == 0:
    print("> even number")
default:
    print("> odd number")
}

let coordinate = (x: 10, y: 3)

switch coordinate {
case (0, 0):
    print("> zero")
case (let x, 0):
    print("> on x: \(x)")
case (0, _):
    print("> on y")
case (let x, let y) where x == y:
    print("> x = y: \(x), \(y)")
case (let x, let y):
    print("> somewhere: \(x), \(y)")
}
