import Cocoa

//1. მოდით ჩვენს ხომალდს მივხედოთ SOLID Principle-ბის დაცვით.
//შევქმნათ Class-ი PirateShip⛴️🏴‍☠️, with properties: როგორციაა name, cannonsCount, crew👫 და cargo🍗🍖🥃🍺.
//Methods: firingCannons, adding/removing crew, adding/removing cargo.
//
//დავიცვათ Single Responsibility ამისათვის - cargo management და adding/removing crew ფუნქციონალი უნდა განვაცალკევოთ.
//შესაბამისად მოდი შევქმნათ 2 Manager class-ი (CargoManager, CrewManager), სადაც გავიტანთ crew-ს და cargo-ს და შესაბამის methods გავიტანთ ამ კლასებში.
//
//ამის შემდეგ ჩვენს PirateShip-ში გვრჩება properties: name, cannonsCount და 2 მენეჯერი რომელიც ცალ-ცალკე გააკონტროლებს ჩვენი გემის ფუნქციონალს. Methods გვექნება addCargo, removeCargo, listCargo, addCrew, removeCrew, listCrew, cannonCount, fireCannon(count:) და ამ Method-ებში ჩვენი მენეჯერების შესაბამისი მეთოდები გამოვიყენოთ.
//
//დავიცვათ Open/Closed პრინციპი. ჩვენი მენეჯერები არ უნდა იყოს წვდომადი გარედან და მათი ფუნქციონალის გამოყენება მხოლოდ გემის წევრებს უნდა შეეძლოთ.
//
//დავიცვათ Liskov Substituion, შევქმნათ PirateShip-ის შვილობილი კლასები Frigate და Galleon. დაამატეთ ფუნქციონალი და ცვლადები თქვენი სურვილის მიხედვით, მაგრამ როცა PirateShip-ს Frigate-ით ან Galleon-ით ამოვცვლით ქცევა არ უნდა შეგვეცვალოს.
//
//დავიცვათ Interface Segregation. ყველა გემს არ აქვს საშუალება რომ იქონიონ cannon-ები და აწარმოონ ბრძოლა. ამიტომ შევქმნათ protocol Cannons შესაბამისი მეთოდები და დავაიმპლემენტიროთ PirateShip-ში.
//
//დავიცვათ Dependency Inversion პრინციპი, ამიტომ ჩვენს manager კლასებს გავუკეთოთ პროტოკოლები CargoManaging და CrewManaging სადაც მეთოდებს ავღწერთ რომლებიც აქამდე კლასებში გვქონდა, ხოლო PirateShip-ში CargoManager-ს და CrewManager-ს ჩავანაცვლებთ ამ Protocol-ის ტიპის ცვლადებით, ამითი ჩვენს PirateShips აღარ ეცოდინება სპეციფიური დეტალები თუ როგორ ხდება cargo-ს და crew-ის მენეჯმენტი  მას მხოლოდ აბსტრაქტულად ეცოდინება ის რომ ეს შესაძლებელია. ასევე ამ პრინციპის დაცვით ჩვენ საშუალება გვექნება ნებისმიერ დროს შევცვალოთ Crew და Cargo Management-ის მართვის სისტემა, უბრალოდ ჩავაწვდით ახალ კლასს სხვა იმპლემენტაციით რომელიც ამ პროტოკოლს აიმპლემენტირებს, ამის საშვალებით ჩვენ ნებისმიერ დროს შეგვეძლება PirateShip-ში მარტივი ცვლილებების შეტანა, ისე რომ თვითონ კლასში ცვლილებების გაკეთება არ მოგვიწევს.

class PirateShip: Cannons {
    var name: String
    var cannonsCount: Int
    private var cargoManager: CargoManaging
    private var crewManager: CrewManaging
    
    init(name: String, cannonsCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = cargoManager
        self.crewManager = crewManager
    }
    
    func addCargo(cargo: Cargo) {
        cargoManager.addCargo(cargo: cargo)
    }
    func removeCargo(cargo: Cargo) {
        cargoManager.removeCargo(cargo: cargo)
    }
    func listCargo() {
        cargoManager.listCargo()
    }
    func addCrew(member: Pirate) {
        crewManager.addCrew(member: member)
    }
    func removeCrew(member: Pirate) {
        crewManager.removeCrew(member: member)
    }
    func listCrew() {
        crewManager.listCrew()
    }
    func cannonCount() -> Int {
        print("We have \(cannonsCount) cannon/s 🦜")
        return cannonsCount
    }
    func fireCannon(count: Int) {
        if cannonsCount >= count {
            cannonsCount -= count
            print("\(count) cannons fired! 🧨")
        } else {
            print("Not enough cannons 😭")
        }
    }
    
}

class CargoManager: CargoManaging {
    var cargo = [Cargo]()
    
    func addCargo(cargo: Cargo) {
        self.cargo.append(cargo)
    }
    func removeCargo(cargo: Cargo) {
        self.cargo.removeAll { $0.name == cargo.name
        }
    }
    func listCargo() {
        cargo.forEach({print($0.name)})
    }
}

class CrewManager: CrewManaging {
    var crew = [Pirate]()
    
    func addCrew(member: Pirate) {
        crew.append(member)
    }
    func removeCrew(member: Pirate) {
        crew.removeAll(where: {$0.nickname == member.nickname})
    }
    func listCrew() {
        crew.forEach({print($0.nickname)})
    }
}

class Pirate {
    var nickname: String
    
    init(nickname: String) {
        self.nickname = nickname
    }
}

class Cargo {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Frigate: PirateShip {
    func reloadCannons (cannons: Int) {
        cannonsCount += cannons
    }
}

class Galleon: PirateShip {
    
}

protocol Cannons {
    func cannonCount() -> Int
    func fireCannon(count: Int)
}

protocol CargoManaging {
    func addCargo(cargo: Cargo)
    func removeCargo(cargo: Cargo)
    func listCargo()
}

protocol CrewManaging {
    func addCrew(member: Pirate)
    func removeCrew(member: Pirate)
    func listCrew()
}

//2.TreasureMap KISS პრინციპის დაცვით.
//
//TreasureMap კლასი გვექნება ძალიან მარტივი ორი ფროფერთით: x და y ექნება. ერთი მეთოდი hintToTreasure, რომელიც მიიღებს x და y-ს და თუ ვიპოვეთ ჩვენი საგანძური დაგვიწერს ამას, თუ არასწორად მივუთითებთ კოორდინატებს მაშინ უნდა მოგვცეს hint-ი თუ საით უნდა წავიდეთ რომ მივაგნოთ საგანძურს.



class TreasureMap {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func hintToTreasure(coordinateX: Int, coordinateY: Int) {
        if coordinateX == self.x && coordinateY == self.y {
            print("Congrats! 🍾")
        }
        if coordinateX > x {
            print("Go ⬅️ and")
        } else {
            print("Go ➡️ and")
        }
        if coordinateY > y {
            print("Go ⬇️")
        } else {
            print("Go ⬆️")
        }
    }
}

//3.SeaAdventure YAGNI პრინციპის დაცვით, პირატების მოგზაურობა თავგადასავლის გარეშე ვის გაუგია
//
//შევქმნათ მარტივი SeaAdventure class-ი, ერთი String adventureType ფროფერთით და ერთი მეთოდით encounter რომელიც დაგვიბეჭდავს თუ რა adventure-ს წააწყდა ჩვენი ხომალდი. დავიცვათ YAGNI და არ დავამატოთ გავრცობილი ფუნქციონალი რომელიც სხვადასხვა adventure-ს შეიძლება მოიცავდეს, რომელიც ჯერ ჯერობით არ გვჭირდება.

class SeaAdventure {
    var adventureType: String
    
    init(adventureType: String){
        self.adventureType = adventureType
    }
    
    func encounter() {
        print(adventureType)
    }
}

//4. PirateCode DRY პრინციპის დაცვით.
//
//შევქმნათ მარტივი კლასი PirateCode, რომელსაც ექნება ორი მეთოდი parley და mutiny, ამ მეთოდებში უნდა დავიწყოთ განხილვა მოლაპარაკებებზე წავალთ თუ ვიბრძოლებთ ეს კოდი რომ ორივე მეთოდში არ გაგვიმეორდეს დავიცვათ DRY პრინციპი და შევქმნათ ერთი private ფუნქცია discussTerms(term: String), რომელიც შეგვატყობინებს იმას რომ მოლაპარაკებები დაწყებულია, ხოლო parley და mutiny მოლაპარაკების შედეგს დაგვიბეჭდავენ.

class PirateCode {
    private func discussTerms(term: String) {
        print("\(term) discussion has been started.")
    }
    
    func parley(term: String) {
        discussTerms(term: term)
        print("Discussion result: Peace! 🕊️")
    }
    func mutiny(term: String) {
        discussTerms(term: term)
        print("Discussion result: War! ⚔️")
    }
}

//5. დროა საგანძურის საძებნელად გავეშვათ. (Treasure hunting😄💰)
//
//შევქმნათ ჩვენი ხომალდი დავარქვათ სახელი, ეკიპაჟი დავამატოთ, საომრად გავამზადოთ, ავტვირთოთ cargo.
//
//შევქმნათ ჩვენი საგანძულის კარტა და გადავაწდოთ კოორდინატები.
//
//შევქმნათ პირატის კოდექსი რომელიც მოგზაურობისას დაგვეხმარება.
//
//შევქმნათ SeaAdventure რომელსაც ჩვენი ეკიპაჟი შეიძლება გადააწყდეს, ამ შემთხვევაში ეს იქნება FlyingDutchman-თან გადაყრა.
//
//
//
//პირველ რიგში დავიწყოთ ჩვენი საგანძურის ძებნით შევქმნათ ორი ცვლადი საწყისი კოორდინატები საიდანაც ჩვენი გემი აიღებს გეზს, და treasureMap-ის hintToTreasure მეთოდის გამოყენებით ვეცადოთ ვიპოვოთ ჩვენი საგანძური.
//
//
//
//საგანძურის პოვნის შემდეგ გადააწყდება adventure-ს, დავბეჭდოთ რა adventure-ა, PirateCode-ს გამოყენებით გადავწყვიტოთ რას იზამს ჩვენი კაპიტანი, ეცდება აარიდოს თავი თავგადასავალს თუ მიხვდება რომ აზრი არ აქვს მოლაპარაკებებს და შეუტევს? არჩევის შემდეგ რის განხილვას მოახდენს თავის ეკიპაჟთან ერთად? როგორ გაიქცეს თუ როგორ შეუტიოს ეფექტურად? გამოიყენებს ის ყველა არსებულ cannon-ს ხომალდზე თუ არა?
//
//
//
//ამ რთულ გადაწყვეტილების მიღების შემდეგ ჩვენ უკვე ვეღარასდროს ვერ გავიგებთ თუ როგორ დამთავრდა ჩვენი კაპიტნის და მისი ეკიპაჟის ამბავი.😄

var cargoManager = CargoManager()
var crewManager = CrewManager()

var myShip = PirateShip(name: "The Black Pearl", cannonsCount: 100, cargoManager: cargoManager, crewManager: crewManager)

var cargo1 = Cargo(name: "Swords")
var cargo2 = Cargo(name: "Food")
var cargo3 = Cargo(name: "Drinks")
var cargo4 = Cargo(name: "Gunpowder")

myShip.addCargo(cargo: cargo1)
myShip.addCargo(cargo: cargo2)
myShip.addCargo(cargo: cargo3)
myShip.addCargo(cargo: cargo4)

var crewMember1 = Pirate(nickname: "crewMember1")
var crewMember2 = Pirate(nickname: "crewMember2")
var crewMember3 = Pirate(nickname: "crewMember3")
var crewMember4 = Pirate(nickname: "crewMember4")

myShip.addCrew(member: crewMember1)
myShip.addCrew(member: crewMember2)
myShip.addCrew(member: crewMember3)
myShip.addCrew(member: crewMember4)

myShip.listCrew()
myShip.listCargo()

var treasureMap = TreasureMap(x: 140, y: 400)
var pirateCode = PirateCode()
var seaAdventure = SeaAdventure(adventureType: "Approaching FlyingDutchman")

var startx = 10
var starty = 40

treasureMap.hintToTreasure(coordinateX: startx, coordinateY: starty)

seaAdventure.encounter()
pirateCode.mutiny(term: "⚔️ vs 🕊️")
myShip.fireCannon(count: 40)
