import Foundation

//1-ControlCenter-ი.
//With properties: isLockedDown: Bool და securityCode: String, რომელშიც იქნება რაღაც პაროლი შენახული.
//Method lockdown, რომელიც მიიღებს პაროლს, ჩვენ დავადარებთ ამ პაროლს securityCode-ს და თუ დაემთხვა გავაკეთებთ lockdown-ს.
//Method-ი რომელიც დაგვიბეჭდავს ინფორმაციას lockdown-ის ქვეშ ხომ არაა ჩვენი ControlCenter-ი.

class ControlCenter: StationModule {
    var isLockedDown: Bool
    var securityCode: String
    
    init(isLockedDown: Bool, securityCode: String, moduleName: String, drone: Drone? = nil) {
        self.isLockedDown = isLockedDown
        self.securityCode = securityCode
        super.init(moduleName: moduleName, drone: drone)
    }
    
    func lockdown(securityCode: String) {
        if securityCode == self.securityCode {
            isLockedDown = true
            print("☢️ Lockdown Initiated ☢️")
        }
    }
    
    func checkLockdown() {
        print("Lockdown Status: \(isLockedDown)")
    }
}

//var controlCenter = ControlCenter(isLockedDown: false, securityCode: "140")
//controlCenter.lockdown(securityCode: "140")
//controlCenter.checkLockdown()
//controlCenter.moduleName

//2-ResearchLab-ი.
//With properties: String Array - ნიმუშების შესანახად.
//Method რომელიც მოიპოვებს(დაამატებს) ნიმუშებს ჩვენს Array-ში.

class ResearchLab: StationModule {
    var sampleArray: [String]
    
    init(sampleArray: [String], moduleName: String, drone: Drone? = nil) {
        self.sampleArray = sampleArray
        super.init(moduleName: moduleName, drone: drone)
    }
    
    func addSample(sample: String) {
        sampleArray.append(sample)
    }
}

//3-LifeSupportSystem-ა.
//With properties: oxygenLevel: Int, რომელიც გააკონტროლებს ჟანგბადის დონეს.
//Method რომელიც გვეტყვის ჟანგბადის სტატუსზე.

class LifeSupportSystem: StationModule {
    var oxygenLevel: Int
    
    init(oxygenLevel: Int, moduleName: String, drone: Drone? = nil) {
        self.oxygenLevel = oxygenLevel
        super.init(moduleName: moduleName, drone: drone)
    }
    
    func checkOxygenLevel () -> Int {
        self.oxygenLevel
    }
}

//4-StationModule-ი
//With properties: moduleName: String და drone: Drone? (optional).
//Method რომელიც დრონს მისცემს თასქს.

class StationModule {
    var moduleName: String
    var drone: Drone?
    
    init(moduleName: String, drone: Drone? = nil) {
        self.moduleName = moduleName
        self.drone = drone
    }
    
    func assignTask (task: String) {
        if let drone = self.drone {
            drone.task = task}
    }
}

let stationModule = StationModule(moduleName: "controlCenterStationModule")
let researchModule = StationModule(moduleName: "researchLabModule")
let lifeSupportSystemModule = StationModule(moduleName: "lifeSupportSystemModule")

//5-ჩვენი ControlCenter-ი ResearchLab-ი და LifeSupportSystem-ა გავხადოთ StationModule-ის subClass.

//6-Drone.
//With properties: task: String? (optional), unowned var assignedModule: StationModule, weak var missionControlLink: MissionControl? (optional).
//Method რომელიც შეამოწმებს აქვს თუ არა დრონს თასქი და თუ აქვს დაგვიბჭდავს რა სამუშაოს ასრულებს ის.

class Drone {
    var task: String?
    unowned var assignedModule: StationModule
    weak var missionControlLink: MissionControl?
    
    init(task: String? = nil, assignedModule: StationModule, missionControlLink: MissionControl? = nil) {
        self.task = task
        self.assignedModule = assignedModule
        self.missionControlLink = missionControlLink
    }
    
    func hasTask() -> Bool {
        if task != nil {
            print("Drone has task: \(task ?? "No Task")")
            return true
        } else {
            print("Drone has no task")
            return false
        }
    }
}

let controlCenterDrone = Drone(task: "controlling", assignedModule: stationModule)
let researchLabDrone = Drone(task: "researching", assignedModule: researchModule)
let lifeSupportSystemDrone = Drone(task: "supporting", assignedModule: lifeSupportSystemModule)

//7-OrbitronSpaceStation-ი შევქმნათ, შიგნით ავაწყოთ ჩვენი მოდულები ControlCenter-ი, ResearchLab-ი და LifeSupportSystem-ა. ასევე ამ მოდულებისთვის გავაკეთოთ თითო დრონი და მივაწოდოთ ამ მოდულებს რათა მათ გამოყენება შეძლონ.
//ასევე ჩვენს OrbitronSpaceStation-ს შევუქმნათ ფუნქციონალი lockdown-ის რომელიც საჭიროების შემთხვევაში controlCenter-ს დალოქავს.

class OrbitronSpaceStation {
    var controlCenter = ControlCenter(isLockedDown: false, securityCode: "1234", moduleName: "controlCenterModule", drone: controlCenterDrone)
    var researchLab = ResearchLab(sampleArray: ["moonSample"], moduleName: "researchModule", drone: researchLabDrone)
    var lifeSupportSystem = LifeSupportSystem(oxygenLevel: 98, moduleName: "lifeSupportSystemModule", drone: lifeSupportSystemDrone)
    
//    init(controlCenter: ControlCenter, researchLab: ResearchLab, lifeSupportSystem: LifeSupportSystem) {
//        self.controlCenter = controlCenter
//        self.researchLab = researchLab
//        self.lifeSupportSystem = lifeSupportSystem
//    }
    
    func lock() {
        controlCenter.isLockedDown = true
    }
}

//8-MissionControl.
//With properties: spaceStation: OrbitronSpaceStation? (optional).
//Method რომ დაუკავშირდეს OrbitronSpaceStation-ს და დაამყაროს მასთან კავშირი.
//Method requestControlCenterStatus-ი.
//Method requestOxygenStatus-ი.
//Method requestDroneStatus რომელიც გაარკვევს რას აკეთებს კონკრეტული მოდულის დრონი.

class MissionControl {
    var spaceStation: OrbitronSpaceStation?
    
    init(spaceStation: OrbitronSpaceStation? = nil) {
        self.spaceStation = spaceStation
    }
    
    func connectStation(station: OrbitronSpaceStation) {
        self.spaceStation = station
    }
    func requestControlCenterStatus() {
        self.spaceStation!.controlCenter.checkLockdown()
    }
    func requestOxygenStatus(oxygenStatus: OrbitronSpaceStation) {
        self.spaceStation!.lifeSupportSystem.oxygenLevel
    }
    func requestDroneStatus(module: StationModule) {
        module.drone?.hasTask()
    }
}

//9-და ბოლოს
//შევქმნათ OrbitronSpaceStation,
//შევქმნათ MissionControl-ი,
//missionControl-ი დავაკავშიროთ OrbitronSpaceStation სისტემასთან,
//როცა კავშირი შედგება missionControl-ით მოვითხოვოთ controlCenter-ის status-ი.
//controlCenter-ის, researchLab-ის და lifeSupport-ის მოდულების დრონებს დავურიგოთ თასქები.
//შევამოწმოთ დრონების სტატუსები.
//შევამოწმოთ ჟანგბადის რაოდენობა.
//შევამოწმოთ ლოქდაუნის ფუნქციონალი და შევამოწმოთ დაილოქა თუ არა ხომალდი სწორი პაროლი შევიყვანეთ თუ არა.

let orbitronSpaceStation = OrbitronSpaceStation()
let missionControl = MissionControl()
missionControl.connectStation(station: orbitronSpaceStation)
missionControl.requestControlCenterStatus()
missionControl.spaceStation?.controlCenter.drone?.task = "Control Center"
missionControl.spaceStation?.researchLab.drone?.task = "Monitor Lab"
missionControl.spaceStation?.lifeSupportSystem.drone?.task = "c'mon do something"
missionControl.spaceStation?.controlCenter.drone?.hasTask()
missionControl.spaceStation?.researchLab.drone?.hasTask()
missionControl.spaceStation?.lifeSupportSystem.drone?.hasTask()
missionControl.spaceStation?.lifeSupportSystem.checkOxygenLevel()
missionControl.spaceStation?.controlCenter.lockdown(securityCode: "1234")
missionControl.spaceStation?.controlCenter.checkLockdown()
