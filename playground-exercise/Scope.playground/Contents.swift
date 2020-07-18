import UIKit

func hello() {
    var hours = 50
    let payPerHour = 10000
    var salary = 0

    if hours > 40{
        let extraHours = hours - 40
        salary += extraHours * payPerHour * 2
        hours -= extraHours
    }

    salary += hours * payPerHour

    print(hours)

}

hello()
