import Cocoa

//1. შევქმნათ Class-ი SuperEnemy with properties: String name, Int hitPoints (ანუ სიცოცხლის რაოდენობა).
//
//სურვილისამებრ დაამატებ properties რომელიც მას აღწერს.

class SuperEnemy {
    var name: String
    var hitPoints: Int
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}

//2. შევქმნათ Superhero Protocol-ი.
//
//შემდეგი get only properties: String name, String alias, Bool isEvil და დიქშენარი (dictionary) superPowers [String: Int], სადაც String-ი არის სახელი და Int არის დაზიანება (damage).
//
//Method attack, რომელიც მიიღებს target SuperEnemy-ის და დააბრუნებს (return) Int-ს ანუ დარჩენილ სიცოცხლე.
//
//Method performSuperPower, რომელიც მიიღებს SuperEnemy-ის და დააბრუნებს (return) Int-ს, აქაც დარჩენილ სიცოცხლე.

protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String: Int] { get }
    var damage: Int { get }
    var icon: String { get }
    var superDamege: Int { get }
    
    mutating func attack (target: SuperEnemy) -> Int
    mutating func performSuperPower (superEnemy: SuperEnemy) -> Int
}

// 3. Superhero-ს extension-ი გავაკეთოთ სადაც შევქმნით method-ს რომელიც დაგვი-print-ავს ინფორმაციას სუპერ გმირზე და მის დარჩენილ superPower-ებზე.

extension Superhero {
    func heroInfo () {
        print(self.name, self.superPowers)
    }
}

//4. შევქმნათ რამოდენიმე სუპერგმირი Struct-ი რომელიც ჩვენს Superhero protocol-ს დააიმპლემენტირებს მაგ:
//
//struct SpiderMan: Superhero და ავღწეროთ protocol-ში არსებული ცვლადები და მეთოდები.
//
//attack მეთოდში -> 20-იდან 40-ამდე დავაგენერიროთ Int-ის რიცხვი და ეს დაგენერებული damage დავაკლოთ SuperEnemy-ს სიცოცხლეს და დარჩენილი სიცოცხლე დავაბრუნოთ( return).
//
//performSuperPower-ს შემთხვევაში -> დიქშენერიდან ერთ superPower-ს ვიღებთ და ვაკლებთ enemy-ს (სიცოცხლეს ვაკლებთ). ვშლით ამ დიქშენერიდან გამოყენებულ superPower-ს. გამოყენებული superPower-ი უნდა იყოს დარანდომებული. დარჩენილ enemy-ს სიცოცხლეს ვაბრუნებთ (return).

struct SpiderMan: Superhero {
    
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String : Int]
    var damage: Int
    var icon: String
    var superDamege: Int
    
    mutating func attack(target: SuperEnemy) -> Int {
        self.damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }
    mutating func performSuperPower(superEnemy: SuperEnemy) -> Int {
        var randomSuper = self.superPowers.randomElement()
        superEnemy.hitPoints -= randomSuper!.value
        self.superDamege = randomSuper!.value
        self.self.superPowers.removeValue(forKey: randomSuper!.key)
        return superEnemy.hitPoints
    }
}

//5. შევქმნათ class SuperherSquad,
//რომელიც ჯენერიკ Superhero-s მიიღებს. მაგ: class SuperheroSquad<T: Superhero>.
//
//შევქმნათ array სუპერგმირების var superheroes: [T].
//
//შევქმნათ init-ი.
//შევქმნათ method რომელიც ჩამოგვითვლის სქვადში არსებულ სუპერგმირებს.

class SuperheroSquad<T: Superhero> {
    var superHeroes: [T]
    
    init(superHeroes: [T]) {
        self.superHeroes = superHeroes
    }
    
    func listSuperHeroes() {
        self.superHeroes.forEach({print($0.name)})
    }
}

//6.ამ ყველაფრის მერე მოვაწყოთ ერთი ბრძოლა. 🤺🤜🏻🤛🏻
//შევქმნათ method simulateShowdown. ეს method იღებს სუპერგმირების სქვადს და იღებს SuperEnemy-ს.
//
//სანამ ჩვენი super enemy არ მოკვდება, ან კიდევ სანამ ჩვენ სუპერგმირებს არ დაუმთავრდებათ სუპერ შესაძლებლობები გავმართოთ ბრძოლა.
//
//ჩვენმა სუპერ გმირებმა რანდომად შეასრულონ superPowers, ყოველი შესრულებული superPowers-ი იშლება ამ გმირის ლისტიდან. თუ გმირს დაუმთავრდა superPowers, მას აქვს ბოლო 1 ჩვეულებრივი attack-ის განხორციელება (ამ attack განხორიციელება მხოლოდ ერთხელ შეუძლია როცა superPowers უმთავრდება).
//
//
//
//ბოლოს შედეგი დავბეჭდოთ, მოიგეს სუპერ გმირება თუ enemy-მ,
//
//ასევე კარგი იქნება თუ ორთაბრძოლის მიმდინარეობასაც დავბეჭდავთ და გამოვიყენებთ extension-ის მეთოდს.

func simulateShowdown<T: Superhero> (superSquad: [T], superEnemy: SuperEnemy) {
    for i in superSquad {
        var hero = i
        while superEnemy.hitPoints > 0 && hero.superPowers.count > 0 {
            hero.performSuperPower(superEnemy: superEnemy)
            print("Battle: \(hero.icon) vs 🦹‍♀️")
            print("🥊 Dealt: \(hero.superDamege) || Health ⛑️: \(superEnemy.hitPoints)")
        }
        if hero.superPowers.count == 0 && superEnemy.hitPoints > 0 {
            hero.attack(target: superEnemy)
            print("Battle: \(hero.icon) vs 🦹‍♀️")
            print("🥊 Dealt: \(hero.damage) || Health ⛑️: \(superEnemy.hitPoints)")
        }
        if superEnemy.hitPoints <= 0 {
            print("VICTORY!", hero.icon, "🏆")
            break
        }
    }
    if superEnemy.hitPoints > 0 {
        print ("Game Over! 🦹🏻‍♀️ 🏆")
    }
}

var enemy = SuperEnemy(name: "Villain", hitPoints: 140)
var superHero1 = SpiderMan(name: "SpiderMan1", alias: "Spider", isEvil: false, superPowers: ["Venom Blast": 10, "Inner Beast Attack": 20], damage: 0, icon: "🕷️", superDamege: 0)
var superHero2 = SpiderMan(name: "SpiderMan2", alias: "Spider", isEvil: false, superPowers: ["Blast Attack": 7, "Cutting Wave": 10, "Combined Attack": 20], damage: 0, icon: "🦸‍♀️", superDamege: 0)
var superheroArray = [superHero1, superHero2]

simulateShowdown(superSquad: superheroArray, superEnemy: enemy)
