import Cocoa
import Foundation

// 1. შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.

func factorial(num: Int) -> Int {
    var result = 1
    for i in 1...num {
        result *= i
    }
    return result
}

factorial(num: 5)

// 2. შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.

func fibonacci() {
    var last = 0
    var current = 1
    var result = 1
    
    for i in 1...20{
        var temp = 0
        print ("Fibonacci number \(i) is \(result)")
        result = last + current
        temp = current
        current = result
        last = temp
    }
}

fibonacci()

// 3. შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.

func stringer(input: String) -> Bool {
    var string = ""
    for i in input {
        string = String(i) + string
    }
    
    if input == string {
        return true
    } else {
        return false
    }
}

stringer(input: "racecar")

// 4. შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

func m2(numArray: [Int]) -> [Int] {
    var result = [Int]()
    for i in numArray {
        result.append(i * i)
    }
    print(result)
    return result
}

m2(numArray: [2,4])

// 5. შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]

func wordCounter(string: String) -> [String: Int] {
    var result = [String: Int]()
    var resultString = string
    
    resultString.removeAll { i in
        i == "," || i == "."
    }
    let lowerString = resultString.lowercased()
    let finalString = lowerString.split(separator: " ")
    
    for i in finalString {
        
        if result[String(i)] == nil{
            result[String(i)] = 1
        }
        else {
            result[String(i)]! += 1
        }
    }
    
    print(result)
    
    return result
}

wordCounter(string: "TBC x USAID, tbc it academy, we are in TBC academy.")

// 6. შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.

var binary = { (number: Int) -> (Int) in
    var x = number
    var counter = 0
    var arrayx = [Int]()
    var x2 = 2
    var result = ""
    var temp = 0
    
    while x2 <= x {
        arrayx.append(x2)
        x2 *= 2
        counter += 1
    }
    arrayx.sort(by: {$0>$1})
    print(arrayx)
    
    for i in arrayx {
        print(x)
        if x >= i {
            print("i", i)
            print(x)
            x -= i
            temp = 1
            result += String(temp)
        } else if x >= 1{
            temp = 0
            result += String(temp)
        }
    }
    if x == 1 {
        temp = 1
        result += String(temp)
    }
    if x == 0 {
        temp = 0
        result += String(temp)
    }
    print(result)
    return counter
}

binary(259)

// მეორე ვარიანტი

var binary1 = { (number: Int) -> (Int) in
    let binary = String(number, radix: 2)
    
    return Int(binary) ?? 0
}

binary1(44)

// 7. შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.

var oddFilter = { (array: inout [Int]) -> ([Int]) in
    array.removeAll { $0 % 2 == 1 }
    
    return array
}

var oddArray = [1,2,3,4,5,6,7,8,9,10]

oddFilter(&oddArray)

// 8. შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.

var mapClosure = { (array: inout [Int]) -> ([Int]) in
    var resultArray = [Int]()
    array.map { element in
        var temp = Int()
        temp = element * 10
        resultArray.append(temp)
        
    }
    return resultArray
}

mapClosure(&oddArray)

// 9. გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.

var escapingClosure = { (array: [Int]) -> () in
    DispatchQueue.main.asyncAfter (deadline: .now()+3){
        print(array)
    }
}

escapingClosure([1,2,3,4])

// 10. function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.

func mapFunc (array: [String]) -> [Int] {
    
    var intArray = array.compactMap { element in
        Int(element)
    }
    var resultArray = intArray.filter { $0 % 2 == 0}
    
    return resultArray
}

mapFunc(array: ["1","2","3","4"])
