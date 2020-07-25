import UIKit

struct Location {
    let x: Int
    let y: Int
}

let one = (loc: Location(x: 3, y: 5), name: "a")
let two = (loc: Location(x: 3, y: 5), name: "b")
let three = (loc: Location(x: 4, y: 6), name: "c")

func distance(current: Location, target: Location) -> Double {
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

let currentLocation = Location(x: 2, y: 2)
let places = [one, two, three]

for place in places {
    print(distance(current: currentLocation, target: place.loc))
}


