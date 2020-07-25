import UIKit

var scoreDic: [String: Int] = ["Aaron": 30, "Syeda": 100, "Kelly": 50]
//var scoreDic: Dictionary<String, Int> = ["Aaron": 30, "Syeda": 60, "Kelly": 50]

if let score = scoreDic["Syeda"] {
    score
}

scoreDic.isEmpty
scoreDic.count

scoreDic["Aaron"] = 99
scoreDic["Jack"] = 100
scoreDic["John"] = 60
scoreDic["John"] = nil

for (name, score) in scoreDic {
    print(name, score)
}

for key in scoreDic.keys {
    print(key)
}

for value in scoreDic.values {
    print(value)
}

scoreDic

var myDic: [String: String] = ["name": "Aaron", "city": "Mars", "job": "the President"]

func printNameAndCity(dic: [String: String]) {
    if let name = dic["name"], let city = dic["city"] {
        print(name, city)
    } else {
        print("can't find")
    }
}


printNameAndCity(dic: myDic)
