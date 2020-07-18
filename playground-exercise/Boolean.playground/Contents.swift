import UIKit

let yes = true
let no = false

let isFourGreaterThanFive = 4 > 5

if isFourGreaterThanFive {
    print("---> True")
} else {
    print("---> False")
}

let a = 5
let b = 10

if a > b {
    print("---> a is bigger b.")
} else {
    print("---> b is bigger than a.")
}

let name1 = "Aaron"
let name2 = "Anna"

let isTwoNameSame = name1 == name2

if isTwoNameSame {
    print("---> Same")
} else {
    print("---> Different")
}

let isAnna = name2 == "Anna"
let isMale = false

let annaAndMale = isAnna && isMale
let annaOrMale = isAnna || isMale

let greetingMessage: String
if isAnna {
    greetingMessage = "Hello, Anna"
} else {
    greetingMessage = "Hello, Stranger"
}

print("---> Msg: \(greetingMessage)")

let greetingMessage2: String = isAnna ? "Hello, Anna" : "Hello, Stranger"
print("---> Msg: \(greetingMessage2)")
