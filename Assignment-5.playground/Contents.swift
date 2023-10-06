import Cocoa

// 1. შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.

enum DayOfWeek {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

func restDay (day: DayOfWeek) {
    switch day {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print ("\(day.self) is working day 🧑‍💻")
        
    case .saturday, .sunday:
        print ("\(day.self) is rest day 💤")
    }
}

restDay(day: .saturday)

// 2. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case sunny (Celsius: Double)
    case cloudy (Celsius: Double)
    case rainy (Celsius: Double)
    case snowy (Celsius: Double)
}

func weather (weather: Weather) {
    switch weather {
    
    case .sunny(Celsius: let Celsius):
        "Its Sunny outside, \(Celsius) degress, you will need 🩳"
    case .cloudy(Celsius: let Celsius):
        "Its Cloudy outside, \(Celsius) degress, you will need an 🧥"
    case .rainy(Celsius: let Celsius):
        "Its Rainy outside, \(Celsius) degress, you will need ☔️"
    case .snowy(Celsius: let Celsius):
        "Its Snowy outside, \(Celsius) degress, you will need 🧤"
    }
}

weather(weather: .sunny(Celsius: 10))

// 3. შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.

struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}

var book1 = Book(title: "Book1", author: "Author1", publicationYear: 1901)
var book2 = Book(title: "Book2", author: "Author2", publicationYear: 1902)
var book3 = Book(title: "Book3", author: "Author3", publicationYear: 1903)

var bookArray = [
    book1, book2, book3
]

func books (array: [Book], year: Int) -> [Book] {
    array.filter({$0.publicationYear > year})
}

books(array: bookArray, year: 1901)

// 4. შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.

struct BankAccount {
    var holderName: String
    var accountNumber: Int
    var balance: Int
    
    mutating func add (ammount: Int) {
        balance += ammount
        print("Hello \(holderName), your new balance is \(balance) 💸")
    }
    mutating func withdraw (ammount: Int) {
        if balance >= ammount {
            balance -= ammount
            print("Hello \(holderName), your new balance is \(balance) 💸")
        } else {
            print ("Transaction failed ❌, balance: \(balance), requested: \(ammount)")
        }
    }
}

var client = BankAccount(holderName: "David", accountNumber: 0, balance: 100)
client.add(ammount: 300)
client.withdraw(ammount: 400)

// 5. შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.

enum Genre {
    case hip_hop, pop, rock, country
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        title + " 🎧 " + artist + " 🎤"
    }
    lazy var publisher: String? = {
        "print(String(newValue))"
    }()
}

var playlistArr = [
        Song(title: "God's Plan", artist: "Drake", duration: 3.19, genre: .pop),
        Song(title: "Paint the Town Red", artist: "Doja Car", duration: 3.5, genre: .hip_hop),
        Song(title: "I Remember Everything", artist: "Zach Bryan", duration: 3.47, genre: .country, publisher: "Warner Chappell Music"),
        Song(title: "stairway to heaven", artist: "Led Zeppelin", duration: 8.02, genre: .rock)
]

var song9 = Song(title: "I Remember Everything", artist: "Zach Bryan", duration: 3.47, genre: .country, publisher: "Warner Chappell Music")
var song4 = Song(title: "I Remember Everything", artist: "Zach Bryan", duration: 3.47, genre: .country)

func genreFilter (playlist: [Song], genre: Genre) -> [Song] {
    var result = [Song]()
    result = playlist.filter({$0.genre == genre})
    
    for song in result {
        print(song.description)
        
    }
    return result
}

genreFilter(playlist: playlistArr, genre: .country)
