import UIKit

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = .pasta(taste: "Cream")
dinner = .pizza(dough: "Thin", topping: "Shrimp")
dinner = .chicken(withSauce: true)
dinner = .rice

enum PastaTaste {
    case cream, tomato
}

enum PizzaDough {
    case cheeseCrust, thin, original
}

enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum SecondMainDish {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
}

var secondDinner: SecondMainDish

secondDinner = SecondMainDish.pasta(taste: PastaTaste.tomato)
secondDinner = SecondMainDish.pizza(dough: .cheeseCrust, topping: .bacon)
