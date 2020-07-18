import UIKit

print("Hello, world!")
// Prints "Hello, world!"

// mutable variable
var myVariable = 42
myVariable = 50

// immutable variable
let myConstant = 42

// implicit / explicit
let implicitInteger  = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

// type conversion
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// to include values in strings
let apples = 3
let oranges = 5

let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// multiple lines
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

// array
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water" // change the second value in the array
shoppingList.append("blue paint") // append

// dictionary
var occupations = [
    "Malcom": "Captin",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations" // add a key & value in the dictionary

print(shoppingList)

// empty array & dictionary
let emptyArray = [String]()
let emptyDictionary = [String: Float]() // set a new value for a variable or pass an argument to a function

