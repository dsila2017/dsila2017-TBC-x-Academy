import Cocoa

// შექმენით array, შემდეგ პირველ და ბოლო ელემენტს გაუცვალეთ ადგილი, გამზადებული ან უკვე არსებული ფუნქციის გარეშე.  (array-ის ტიპს არაქვს მნიშვნელობა).

var arr1 = [1,2,3,4,5]
var x = arr1[0]

arr1[0] = arr1[arr1.count-1]
arr1[arr1.count-1] = x

//მეორე ვარიანტი

arr1.swapAt(arr1.startIndex, arr1.endIndex-1)
print(arr1)

// შექმენით array, მასში წაშალეთ ნახევარი ელემენტები, თუ კენტი რაოდენობის იქნა დატოვეთ ნაკლები და წაშალეთ მეტი.  მაგ.: თუ იყო 11 ელემენტი 5 დატოვეთ და 6 წაშალეთ. და დაბეჭდეთ მიღებული შედეგი. (array-ის ტიპს არაქვს მნიშვნელობა).

var arr2 = [1,2,3,4,5,6,7,8,9]

if arr2.count % 2 == 0{
    arr2.removeFirst((arr2.count)/2)
} else {
    arr2.removeFirst((arr2.count)/2 + 1)
}

// შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.

var arr3 = [Int]()
var arr3Even = [Int]()
var arr3Odd = [Int]()

for i in 0...10 {
    arr3.append(i)
}

for i in arr3 {
    if i % 2 == 0 {
        arr3Even.append(i)
    } else {
        arr3Odd.append(i)
    }
}
print(arr3Even)
print(arr3Odd)

// შექმენით Double-ების array, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ array-ში.

var arr4 = [0.9, 0.1, 0.2, 0.3, 0.4]
var result4 = 0.0

for i in arr4 {
    if i > result4 {
        result4 = i
    }
}
print(result4)

// შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.

var intArr1 = [8, 4, 9, 9, 0, 2]
var intArr2 = [1, 0, 9, 2, 3, 7, 0, 1]
var resultArr = [Int]()

intArr1.append(contentsOf: intArr2)

for _ in intArr1 {
    resultArr.append(intArr1.min()!)
    var index = intArr1.min()!
    intArr1.remove(at: intArr1.firstIndex(of: index)!)
}

print(resultArr)


// შექმენით String ტიპის ცვლადი და შეამოწმეთ არის თუ არა ყველა ჩარაქტერი ამ სტრინგში უნიკალური. გამოიყენეთ Set-ი ამ თასკის შესასრულებლად.

var string6 = "Hello"
var newString6 = Set<Character>()

for i in string6 {
    newString6.insert(i)
}

if string6.count == newString6.count {
    print (true)
} else {
    print (false)
}

// შექმენით ორი Int-ების Set. გამოიყენეთ მათზე Set-ის მეთოდები როგორიცაა: union, intersection და difference. დაბეჭდეთ შედეგები.

var intSet1: Set = [1,2,3,4]
var intSet2: Set = [4,5,6,7]

print(intSet1.union(intSet2))
print(intSet1.intersection(intSet2))
print(intSet1.symmetricDifference(intSet2))

// შექმენით ორი String-ის Set. შეამოწმეთ არის თუ არა პირველი String-ის Set, მეორეს sub-Set-ი. დაბეჭდეთ შედეგი.

var stringSet1: Set = ["Hello"]
var stringSet2: Set = ["Hello", "Playground"]

if stringSet1.isSubset(of: stringSet2) {
    print("Yes, stringSet1 is subset of stringSet2")
} else {
    print("No, stringSet1 is not subset of stringSet2")
}

// შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

var arr9 = [Int]()

for i in 1...10 {
    arr9.append(i)
    // მეორეჯერ დავამატე რომმ იგივე ელემენტები კიდევ ჩაამატოს
    arr9.append(i)
}

var set9 = Set<Int>()
set9 = Set(arr9)

if arr9.count == set9.count {
    print("array-ში ყველა ელემენტი განსხვავებულია")
} else {
    print("array შეიცავს მსგავს ელემენტებს")
}

// შექმენით Dictionary, სადაც იქნება ფილმის სახელები და მათი რეიტინგები, რეიტინგი (0-10). დაამატეთ მინიმუმ 5 ფილმი, ამის შემდეგ გამოთვალეთ ამ Dictionary-ში არსებული ფილმების საშვალო რეიტინგი. დაბეჭდეთ მიღებული შედეგი.

var dict = [
    "Name1": 1,
    "Name2": 3,
    "Name3": 4,
    "Name4": 7,
    "Name5": 9,
]

var result = 0

for i in dict.values {
    result += i
}

result = result/dict.count
print(result)


