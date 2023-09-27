import UIKit

// 1. შექმენით ორი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ჯამი.

let a = 10
let b = 30

print(a + b)

// 2. შექმენით Int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა, და შეამოწმეთ არის თუ არა ეს რიცხვი 10-ზე მეტი და 20-ზე ნაკლები ან ტოლი, 20-ზე მეტი და 50-ზე ნაკლები ან ტოლი, 50-ზე მეტი და 100-ზე ნაკლები ან ტოლი, 100-ზე მეტი და შედეგი დაბეჭდეთ.

let c = 14

// 10-ზე მეტი რომ ეწერა პირობაში 10 აღარ ჩავთვალე რეინჯში.
switch c {
case 11...20:
    print("This number is in 11...20 range")
case 21...50:
    print("This number is in 21...50 range")
case 51...100:
    print("This number is in 51...100 range")
default:
    print("This number is out of range, please choose number from 11 to 100")
}

// 3. for-in ციკლის გამოყენებით, დაბეჭდეთ რიცხვები 1-იდან 20-ამდე. რიცხვები ეწეროს ერთ ხაზზე, გამოყოფილი იყოს სფეისებით. შედეგი: 1 2 3 4...

var resultString = ""

for number in 1...20 {
    resultString += "\(number) "
}
print(resultString)

// მეორე ვარიანტი

for number in 1...20 {
    print(number, terminator: " ")
}

// 4. while ციკლის გამოყენებით, 1-იდან 100-ამდე დაბეჭდეთ ყველა კენტი რიცხვის ჯამი.

var x = 0

while x < 100 {
    if x % 2 == 1 {
        print(x)
    }
    x += 1
}

// 5. შექმენით String ტიპის ცვლადი, და ციკლის გამოყენებით დაარევერსეთ ეს ცვლადი, მაგ: თუ გვაქვს TBC Academy უნდა მივიღოთ ymedacA CBT.

var startString = "TBC Academy"
var endString = ""

for i in startString.reversed() {
    endString += String(i)
}

print(endString)

// მეორე ვარიანტი

var startString1 = "TBC Academy"
var endString1 = ""

for _ in startString {
    
    endString1 += String(startString1.last!)
    startString1.removeLast()
}

print(endString1)

// მესამე ვარიანტი

var startString2 = "TBC Academy"
var endString2 = ""

for i in startString2 {
    endString2 = String(i) + endString2
}

print(endString2)

// 6. დაბეჭდეთ ყველა ორნიშნა რიცხვი რომელიც ერთნაირი ციფრებით არის შედგენილი.

for number in 10...100 {
    if number % 11 == 0 {
        print(number)
    }
}

// 7. გაქვს 9 ნიშნა რიცხვი და დაბეჭდე შებრუნებული რიცხვი.

var multiDigitNumber = 123456789
var multiDigitString = String(multiDigitNumber)
var digitResultString = ""
var digitResult = 0

for digit in multiDigitString {
    digitResultString = String(digit) + digitResultString
}

// if let-ით ვერ დავწერე პირდაპირ, ცვლადის გატოლებით (if let x = Int(digitResultString) გამოვიდა მაგრამ ისე დავტოვე უფრო მარტივად აღქმადია.

//if let Int(digitResultString) {
digitResult = Int(digitResultString) ?? 0
//}

print(digitResult)

// 8. შექმენით bool-ეან ცვლადი, მაგალითად: isNumberFound და while loop-ის გამოყენებით იპოვეთ პირველი რიცხვი რომელიც იყოფა 5-ზეც და 9-ზეც ერთდროულად. 0-იდან დაიწყეთ ათვლა.

var isNumberFound = false
var numCounter = 0

while isNumberFound == false {
    numCounter += 1
    if numCounter % 5 == 0 && numCounter % 9 == 0 {
        print(numCounter)
        isNumberFound = true
    }
}

// 9. შექმენი String ცვლადი მაგალითად month, რომელსაც მიანიჭებ თვის მნიშვნელობას, მაგალითად: "march" და switch statement-ის გამოყენებით დაბეჭდეთ წელიწადის რა დროა.

var month = "March"

switch month {
case "December", "January", "February":
    print("Winter")
case "March", "April", "May":
    print("Spring")
case "June", "July", "August":
    print("Summer")
case "September", "October", "November":
    print("Autumn")
default: "Error"
}

// 10. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."

var color = "🔴"

while true {
    switch color {
    case "🔴":
        print("🔴", terminator: "->")
        color = "🌕"
    case "🌕":
        print("🌕", terminator: "->")
        color = "🟢"
    case "🟢":
        print("🟢", terminator: "->")
        color = "🔴"
    default: ""
    }
}
