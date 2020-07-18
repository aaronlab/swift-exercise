import UIKit

// use -> to separate the parameter names & types
func greet(_ person: String, day: String) ->
    String {
        return "Hello \(person), today is \(day)."
}

//greet(person: "Bob", day: "Tuesday")
greet("John", day: "Wednesday")
