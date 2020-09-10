var person: (String, Int, Double) = ("me", 100, 222.2)
print("who: \(person.0), age: \(person.1), height: \(person.2)")

person.1 = 99
person.2 = 111.1
print("who: \(person.0), age: \(person.1), height: \(person.2)")

// Enum
enum School: String {
    case primary = "primary"
    case elementary = "elementary"
    case middle = "middle"
    case high = "high"
    case college = "college"
    case university = "university"
    case graduate = "graduate"
}

var highestEducationlLevel: School = .university
print(highestEducationlLevel)
highestEducationlLevel = .graduate
print(highestEducationlLevel)
print(highestEducationlLevel == School.graduate)
print(type(of: highestEducationlLevel))
print(type(of: highestEducationlLevel.rawValue))

enum WeekDays: String, CaseIterable {
    case mon = "Monday"
    case tue = "Tuesday"
    case wed = "Wednesday"
    case thu = "Thursday"
    case fri = "Friday"
    case sat = "Saturday"
    case sun = "Sunday"
}
let today: WeekDays = .thu
print("Today is \(today.rawValue).")

enum Numbers: Int {
    case zero
    case one
    case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.ten.rawValue)")

let primary = School(rawValue: "primary")
let graduate = School(rawValue: "PH")
let one = Numbers(rawValue: 1)
let three = Numbers(rawValue: 3)

if let primary = primary {
    print(type(of: primary))
}

enum PizzaTaste: CaseIterable {
    case cream, tomato
}

enum PizzaDough: CaseIterable {
    case cheeseCrust, thin, original
}

enum PizzaTopping: CaseIterable {
    case pepperoni, cheese, bacon
}

enum MainDish {
    case pasta(taste: PizzaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: .cream)
print(dinner)
dinner = .pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.cheese)
print(dinner)
dinner = .chicken(withSauce: true)
print(dinner)

let allTopings: [PizzaTopping] = PizzaTopping.allCases
print(allTopings)

let allWeekDays: [WeekDays] = WeekDays.allCases
print(allWeekDays)
