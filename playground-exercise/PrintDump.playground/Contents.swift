import UIKit

struct BasicInformation{
    let name: String
    var age: Int
}

var myInfo: BasicInformation = BasicInformation(name: "Aaron", age: 99)

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

let me: Person = Person()

me.height = 1.0
me.weight = 1.0

print(myInfo)
dump(myInfo)

print(me)
dump(me)

