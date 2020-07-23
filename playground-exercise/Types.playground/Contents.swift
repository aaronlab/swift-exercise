//let one: Int = 1
//
//var boolean: Bool = true
//boolean.toggle()
//
//print(Int.random(in: -100...100))
//
//let alphabetA: Character = "A"
//
//let name: String = "Aaron"
//
//var introduce: String = String()
//
//introduce.append("My name is")
//
//introduce = introduce + " " + name + "."
//print(introduce)
//
//print("name count: \(name.count)")
//print("Is introduce empty?: \(introduce.isEmpty)")
//
//print("\u{2665}")
//
//print(name.hasPrefix("Aa"))
//print(name.hasSuffix("A"))

//var name = "Aaron"  // ---> String
//
//typealias MyInt = Int
//let age: MyInt = 100
//
//var person: (String, Int, Double) = ("Aaron", 100, 2000)
//person.1 = 99
//print(person.0, person.1, person.2)
//
//var person2: (name: String, age: Int, height: Double) = ("lol", 100, 99)
//print(person2.name, person2.1, person2.height)
//
//typealias PersonTuple = (name: String, age: Int, height: Double)
//let John: PersonTuple = ("John", 99, 999999)
//let Syeda: PersonTuple = ("Syeda", 89, 8888)

//var names: Array<String> = ["Aaron", "John", "Syeda"]
//var names: [String] = ["Aaron", "John", "Syeda"]    // same with the above
//
//var emptyArray1: [Any] = [Any]()
//var emptyArray2: [Any] = Array<Any>()
//print(emptyArray1.isEmpty, names.count)
//
//names[1] = "Kelly"
//
//names.append("Kelsey")
//names.append(contentsOf: ["Minji", "Changbeom"])
//names.insert("Happy", at: 2)
//
//print(names.index(of: "Syeda"))
//print(names.first)
//print(names.last)
//
//let firstItem: String = names.removeFirst()
//let lastItem: String = names.removeLast()
//let indexZeroItem: String = names.remove(at: 0)
//
//print(firstItem)
//print(lastItem)
//print(indexZeroItem)
//
//print(names)

//typealias StringIntDictionary = [String: Int]
//var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
//var numberForName: [String: Int] = [String: Int]()
//var numberForName: [String: Int] = [:]
//var numberForName: StringIntDictionary = StringIntDictionary()

var numberForName: [String: Int] = ["Aaron": 100, "Syeda": 200, "Kelly": 300]
print(numberForName.isEmpty)
print(numberForName.count)
