
// Int Array
let intArray = [0, 1, 2, 3]

// Map
let mapInt = intArray.map { $0 * 2 }
/*
 [0 * 2, 1 * 2, 2 * 2, 3 * 2] => [0, 2, 4, 6]
 */
print("---> mapInt: \(mapInt)")

// Filter
let filterInt = intArray.filter { $0 % 2 == 0 }
/*
 [Even Numbers]
 */
print("---> filterInt: \(filterInt)")

// Reduce
let reduceInt = intArray.reduce(10) { $0 + $1 }
/*
 10 + 0 + 1 + 2 + 3
 */
print("---> reduceInt = \(reduceInt)")

// String Array
let strArray = ["a", "b", "c", "de"]

// Map
let mapStr = strArray.map { $0 + "x" }
/*
 [a + x, b + x, c + x, de + x] => [ax, bx, cx, dex]
 */
print("---> mapStr: \(mapStr)")

// Filter
let filterStr = strArray.filter { $0.count == 2 }
/*
 return an array that only has the words having 2 characters. => [de]
 */
print("---> filterStr: \(filterStr)")

// Reduce
let reduceStr = strArray.reduce("z") { $0 + $1 }
/*
 z + a + b + c + de => zabcde
 */
print("---> reduceStr: \(reduceStr)")
