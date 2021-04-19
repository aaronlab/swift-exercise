//
//  ARCTest.playground
//
//  Created by Aaron Lee on 2021/04/19.
//  Copyright © 2021 AaronLab. All rights reserved.
//

import Foundation

class Person {

    let name: String

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Aaron Lee")
reference2 = reference1
reference3 = reference1

reference3 = nil

class Person2 {

    let name: String

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    var apartment: Apartment?

    deinit {
        print("\(name) is being deinitialized")
    }

}

class Apartment {

    let number: Int

    init(number: Int) {
        self.number = number
        print("Apartment #\(number) is being initialized")
    }

    var tenant: Person2?

    deinit {
        print("Apartment #\(number) is being deinitialized")
    }

}

print("===>Aaron + Room #73")

var aaron: Person2?
var number73: Apartment?

aaron = Person2(name: "Aaron Lee")
number73 = Apartment(number: 73)

aaron?.apartment = number73
number73?.tenant = aaron

aaron = nil
number73 = nil

print("===>LEAK")

class Person3 {

    let name: String

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    var apartment: Apartment2?

    deinit {
        print("\(name) is being deinitialized")
    }

}

class Apartment2 {

    let number: Int

    init(number: Int) {
        self.number = number
        print("Apartment #\(number) is being initialized")
    }

    weak var tenant: Person3?

    deinit {
        print("Apartment #\(number) is being deinitialized")
    }

}

print("===>Syeda + Room #74")

var syeda: Person3?
var number74: Apartment2?

syeda = Person3(name: "Syeda")
number74 = Apartment2(number: 74)

syeda?.apartment = number74
number74?.tenant = syeda

syeda = nil
number74 = nil

print("===> Apartment + Syeda have been deinitialized")

class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = { [weak self] in
        guard let self = self else { return "" }
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

print("HTML")
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil
