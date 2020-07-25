import UIKit

var evenNumbers: [Int] = [2, 4, 6, 8]
var oddNumbers: Array<Int> = [1, 3, 5, 7]

evenNumbers.append(10)
oddNumbers.append(9)

evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])

evenNumbers.isEmpty

if let firstElement = evenNumbers.first {
    print(firstElement)
}

evenNumbers.min()
evenNumbers.max()

var firstItem = evenNumbers[0]
var secondItem = evenNumbers[1]
var thirdItem = evenNumbers[2]

let oneThree = evenNumbers[0...2]

evenNumbers.insert(0, at: 0)
//evenNumbers.removeAll()

evenNumbers[0] = -2
evenNumbers

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers

for (index, number) in evenNumbers.enumerated() {
    print(index, number)
}

let dropped = evenNumbers.dropFirst(3)
evenNumbers
