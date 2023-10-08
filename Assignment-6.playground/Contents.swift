import Cocoa

// 1. შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func borrowed (){
        isBorrowed = true
    }
    
    func returned (){
        isBorrowed = false
    }
}

//2. შევქმნათ Class Owner
//
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//
//Designated Init.
//
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.

class Owner {
    var ownerID: Int
    var name: String
    var borrowedBooks = [Book]()
    
    init(ownerID: Int, name: String, borrowedBooks: [Book]) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func getBook(book: Book) {
        if book.isBorrowed == false {
            borrowedBooks.append(book)
            book.isBorrowed = true
            print("Hello \(name), here's your 📕")
        } else {
            print("Sorry, 📕 '\(book.title)' is not in library 📚")
        }
    }
    func returnBook(book: Book) {
        if borrowedBooks.contains(where: {$0.bookID == book.bookID}){
            borrowedBooks.removeAll { $0.bookID == book.bookID}
            book.isBorrowed = false
        } else {
            print("\(name), you dont have this 📖 to return ❌")
        }
    }
}

//3. შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//
//Designated Init.
//
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.

class Library {
    var booksArray: [Book]
    var ownersArray: [Owner]
    
    func addBook(book: Book){
        booksArray.append(book)
    }
    func addOwner(owner: Owner){
        ownersArray.append(owner)
    }
    func availableBooks() -> [Book]{
        var result = [Book]()
        result = booksArray.filter({$0.isBorrowed == false})
        return result
    }
    func borrowedBooks() -> [Book]{booksArray.filter({$0.isBorrowed == true})
    }
    func ownerByID(ownerID: Int) -> Owner?{
        if ownersArray.filter({$0.ownerID == ownerID}).count == 0{
            print("Person is not registered 🧍❌")
            return nil
        } else {
            print(ownersArray.filter({$0.ownerID == ownerID}).first!)
            return ownersArray.filter({$0.ownerID == ownerID}).first!
        }
    }
    func borrowedByOwner(owner: Owner) -> [Book]{
        var result = [Book]()
        
        if ownersArray.contains(where: {$0.ownerID == owner.ownerID}) {
            let ownedByID = ownersArray.filter({$0.ownerID == owner.ownerID})
            let booksOwnedByID = ownedByID.first?.borrowedBooks
            
            if booksOwnedByID!.count > 0{
                result = booksOwnedByID!
                print("\(owner.name) has \(booksOwnedByID!.count) book/s 📚:")
                booksOwnedByID!.forEach({print($0.title)})
                return result
            } else {
                result = booksOwnedByID!
                print("This 🧍 has no 📖")
                return result
            }
            
        } else {
            print("Person is not registered 🧍❌")
            return result
        }
    }
    func takeIfAvailable(person: Owner, book: Book){
        if booksArray.contains(where: {$0.bookID == book.bookID}) && book.isBorrowed == false {
            person.getBook(book: book)
        } else {
            print("Sorry \(person.name), 📖 \(book.title) is not in 📚")
        }
    }
    
    init(booksArray: [Book], ownersArray: [Owner]) {
        self.booksArray = booksArray
        self.ownersArray = ownersArray
    }
}

//4. გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

var book1 = Book(bookID: 10, title: "Book1", author: "author1", isBorrowed: false)
var book2 = Book(bookID: 20, title: "Book2", author: "author2", isBorrowed: false)
var book3 = Book(bookID: 30, title: "Book3", author: "author3", isBorrowed: false)
var book4 = Book(bookID: 40, title: "Book4", author: "author4", isBorrowed: false)
var book5 = Book(bookID: 50, title: "Book5", author: "author5", isBorrowed: false)
var book6 = Book(bookID: 60, title: "Book6", author: "author6", isBorrowed: false)
var book7 = Book(bookID: 70, title: "Book7", author: "author7", isBorrowed: false)
var person1 = Owner(ownerID: 1, name: "Person1", borrowedBooks: [])
var person2 = Owner(ownerID: 2, name: "Person2", borrowedBooks: [])
var person3 = Owner(ownerID: 3, name: "Person3", borrowedBooks: [])
var person4 = Owner(ownerID: 4, name: "Person4", borrowedBooks: [])

var library = Library(booksArray: [book1,book2,book3,book4, book5, book6, book7], ownersArray: [person1, person2, person3, person4])

library.availableBooks().count
library.takeIfAvailable(person: person1, book: book1)
library.takeIfAvailable(person: person1, book: book7)
library.takeIfAvailable(person: person2, book: book1)
library.takeIfAvailable(person: person2, book: book4)
person1.returnBook(book: book5)
library.borrowedBooks()
library.availableBooks()
library.borrowedByOwner(owner: person1)
library.ownerByID(ownerID: 10)
