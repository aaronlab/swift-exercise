import UIKit
import Foundation

let closedRange: ClosedRange<Int> = 0...10
let halfClosedRange: Range<Int> = 0..<10

var sum = 0
for i in closedRange {
    print("i = \(i)")
    sum += i
}
print("sum = \(sum)")

sum = 0
for i in halfClosedRange {
    print("i = \(i)")
    sum += i
}
print("sum = \(sum)")

var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "John"
for _ in closedRange {
    print("name \(name)")
}

for i in closedRange{
    if (i % 2 == 0) {
        print("\(i) is an even number")
    }
}

for i in closedRange where i % 2 != 0 {
    print("\(i) is an odd number")
}

for i in closedRange where i != 3 {
    print("\(i) is not three")
}

for i in closedRange {
    if (i == 3) {
        continue
    }
    print("\(i) is not 3")
}

for i in closedRange where i != 0 && i != 1 && i != 10 {
    for j in closedRange where j != 0 && j != 10 {
        print("\(i) * \(j) = \(i * j)")
    }
}
