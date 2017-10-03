//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Ahoj bi-ios"

let const = "Ahoj bi-ios".hashValue
// nejde
//const = ":("

var optionalString : String?
print(optionalString)
optionalString = "Ahoj"
// Pokud je hodnota tak akci provede, jinak ne
//print(optionalString?.hashValue)

if let unwrapped = optionalString {
    print(unwrapped)
} else {
    print("neni tam hodnota")
}

if let _ = optionalString {
    
}


if let optionalString = optionalString {
    _ = optionalString
}

var forcedString : String?
// spadne, nutim hodnotu a ta tam neni
//print(forcedString!.hashValue)

// functions and named arguments
func add(a: Int, b: Int) -> Int {
    return a+b
}

func multiply(_ a : Int, by b: Int) -> Int {
    return a*b
}

multiply(3, by: 5)
add(a: 3, b: 3)

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!

let i = 1
let j = 5
for index in i...j {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
if false {
    
}

extension Int {
    func myFavNumber() -> Int {
        return 3
    }
}

5.myFavNumber()

