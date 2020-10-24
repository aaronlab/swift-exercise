import Foundation

func maskUserIdOfEmail(email: String, maskLength: Int) -> String {
    let components = email.components(separatedBy: "@")
    var userName = Array(components[0])
    
    if userName.count < maskLength {
        fatalError("Index out of range")
    }
    for i in 1...maskLength {
        userName[userName.count - i] = "*"
    }
    return String(userName) + "@" + String(components[1])
}

let emailList = ["aaronlab.net@gmail.com", "john@john.com", "goo@gle.com", "aaple@apple.com"]

for email in emailList {
    print(maskUserIdOfEmail(email: email, maskLength: 3))
}

// MARK: WILL SHOW YOU BELOW
// aaronlab.***@gmail.com
// j***@john.com
// ***@gle.com
// aa***@apple.com
