import Cocoa

enum Mission {
    case findTreasure, findExit
}

class CreateWorld {
    
    var startPoint: String
    var mission: Mission
    var rooms = [Room]()
    var items = [Item]()
    var NPCs = [NPC]()
    
    init(startPoint: String, mission: Mission) {
        self.startPoint = startPoint
        self.mission = mission
    }
    
    func createRoom(roomDescription: String) {
        let newRoom = Room(description: roomDescription)
        rooms.append(newRoom)
    }
    
    func createItem(itemName: String, roomDescription: String) {
        let item = Item(name: itemName)
        let qualifyingRoom = rooms.first { $0.description == roomDescription }
        if qualifyingRoom != nil {
            qualifyingRoom?.itemList.append(item)
            print("New Item: \(item.name) was added to room: \(roomDescription)")
        } else {
            print("No room found!")
        }
    }
    
    func createNPC(name: String, roomDescription: String) {
        let npc = NPC(name: name)
        let qualifyingRoom = rooms.first { $0.description == roomDescription }
        if qualifyingRoom != nil {
            qualifyingRoom?.npc.append(npc)
            print("New NPC: \(npc.name) was added to room: \(roomDescription)")
        } else {
            print("No room found!")
        }
    }
}

class Room {
    var description: String
    var itemList = [Item]()
    var npc = [NPC]()
    
    init(description: String) {
        self.description = description
    }
}

class Item {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func interact() {
        print("\(self.name)")
    }
}

class NPC {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func interact() {
        print("Hello, Im \(self.name)")
    }
}

enum Movement {
    case north, south, east, west
}

class Player {
    var name: String
    var inventory = [Item]()
    
    init(name: String) {
        self.name = name
    }
    
    func move(direction: Movement) {
        print("You moved \(direction)")
    }
    
    func pickItem(item: Item) {
        inventory.append(item)
        print("You've got \(item.name)")
    }
    
    func useItem(itemName: String) {
        
        let qualifyingItem = inventory.first { $0.name == itemName }
        if qualifyingItem != nil {
            qualifyingItem!.interact()
            inventory.removeAll(where: { $0.name == itemName } )
            print("You have used \(qualifyingItem!.name)")
        } else {
            print("You don't have this item in your inventory")
        }
    }
    
    func interactNPC(npc: NPC) {
        npc.interact()
    }
    
    func saveItem(item: Item) {
        inventory.append(item)
    }
}

var newGame = CreateWorld(startPoint: "Paris", mission: .findTreasure)

//newGame.createRoom(roomDescription: "Room1")
//newGame.createNPC(name: "John", roomDescription: "Room1")
//newGame.createItem(itemName: "Torch", roomDescription: "Room1")
//newGame.createItem(itemName: "Torchx", roomDescription: "Room2")
//newGame.createNPC(name: "NPC1", roomDescription: "Room1")
//newGame.rooms.count
//
//var player1 = Player(name: "Peter")
//var item = Item(name: "Xinkali")
//player1.pickItem(item: item)
//player1.useItem(itemName: "Xinkali")
//player1.inventory.count
//player1.interactNPC(npc: newGame.rooms.first!.npc.first!)
