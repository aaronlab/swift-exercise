# Map
Map

## 앱이 사용자 위치에 접근하기 위해 필요한 설정
- Info.plist
    - Privacy - Location When In Use Usage Description

## Functions, nil, Optional Variable
- Function
    - func functionName(parameterName1: type of the parameter, parameterName2: type of the parameter...) -> return type {code}
    - you can't omit the name of parameters.
- Anonymous Function(Closure)
    - { (parameterName: type) -> (return type) in code }
    - { (parameterName: type) in code }
    - { (parameterName) in code }
    - { parameterName in code }
- nill: null
- Optional Variable
    - When you want to declare a variable with the value, which is nil
    - force unwrapping
        - var variableName: type? = some[thing]
        - print(variableName!)
    - implicit unwrapping
        - var variableName: type! = some[thing]
        - print(variableName)
