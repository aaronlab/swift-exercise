# What confuses me

## Optional
```swift
var something: String? = nil  // this can be nil

// force unwrapping
// implicitly unwrapped optionals
var something2 = something! // ---> we'd not better use this
// if a varibale is nil, the force unwrapping causes fatal err
// we can use this for variables that can't be nil every time

// Optional Binding
// we'd better use this way for optional variables
var myName: String?
name = nil

if let name = myName {
    print(name)
}

// optional chaining
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."
```