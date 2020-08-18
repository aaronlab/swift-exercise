import UIKit

let mainGroup = DispatchGroup()
let assetGroup = DispatchGroup()


print("Let's Start Queue")
for i in 1...10 {
    mainGroup.enter()
    print("Main \(i) 🙌")
    for i in 1...10 {
        assetGroup.enter()
        print("Asset \(i) 👉")
        assetGroup.leave()
    }
    assetGroup.notify(queue: .main) {
        mainGroup.leave()
    }
}
mainGroup.notify(queue: .main) {
    print("Main Group Done")
}

