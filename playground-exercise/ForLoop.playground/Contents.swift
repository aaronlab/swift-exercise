import UIKit
import Foundation

let closedRange = 0...10
let halfClosedRange = 0..<10

var sum = 0
for i in closedRange{
    print("---> \(i)")
    sum += i
}

print("---> Total Sum: \(sum)")

sum = 0
for i in halfClosedRange{
    print("---> \(i)")
    sum += i
}

print("---> Total Sum: \(sum)")

var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "Aaron"
for _ in closedRange {
    print("---> Name: \(name)")
}

for i in closedRange {
    if i % 2 == 0{
        print("---> Even Number: \(i)")
    }
}

for i in closedRange where i % 2 != 0 {
    print("---> Odd Number: \(i)")
}

for i in closedRange {
    if i == 3 {
        continue
    }
    print("---> Not 3: \(i)")
}

for i in closedRange where i != 3 {
    print("---> Not 3: \(i)")
}

for i in closedRange where i != 0 && i != 10 {
    for j in closedRange where j != 0 && j != 10 {
        print("Mul: \(i) * \(j) = \(i * j)")
    }
}
