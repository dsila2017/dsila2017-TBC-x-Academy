//
//  ViewController.swift
//  Multithreading _ Concurrency
//
//  Created by David on 11/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Private Properties
    private var bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            
            //MARK: - Version 1
            await taskStarter1()
            
            //MARK: - Version 2
            await taskStarter2()
        }
    }
    
    //MARK: Private Methods
    private func randomGenerator() async -> (Int, Int) {
        let numOne = Int.random(in: 20...50)
        let numTwo = Int.random(in: 20...50)
        
        return (numOne, numTwo)
    }
    
    private func factorialCounter(numbers: (Int, Int)) async -> (Decimal, Decimal) {
        var returnValue: (Decimal, Decimal) = (1, 1)
        
        for i in 1...numbers.0 {
            returnValue.0 *= Decimal(i)
        }
        
        for i in 1...numbers.1 {
            returnValue.1 *= Decimal(i)
        }
        return returnValue
    }
    
    private func raceOne(numbers: (Decimal, Decimal)) async {
        
        let winnerWarrior = Warrior(number: nil)
        
        let thread1 = Thread {
            objc_sync_enter(winnerWarrior)
            winnerWarrior.number = numbers.0
            print("Version 1: Winner Thread is thread1", winnerWarrior.number ?? 0)
        }
        
        let thread2 = Thread {
            objc_sync_enter(winnerWarrior)
            winnerWarrior.number = numbers.1
            print("Version 1: Winner Thread is thread2", winnerWarrior.number ?? 0)
        }
        thread1.start()
        thread2.start()
    }
    
    private func raceTwo(numbers: (Decimal, Decimal)) {
        let winnerWarrior = Warrior(number: nil)
        let newQueue = DispatchQueue(label: "Queue", attributes: .concurrent)
        
        newQueue.async { [self] in
            
            if bool == false {
                bool = true
                winnerWarrior.number = numbers.0
                print("Version 2: Winner Thread is thread1", winnerWarrior.number ?? 0)
            }
        }
        
        newQueue.async { [self] in
            
            if bool == false {
                bool = true
                winnerWarrior.number = numbers.1
                print("Version 2: Winner Thread is thread2", winnerWarrior.number ?? 0)
            }
        }
    }
    
    private func taskStarter1() async {
        let tuple = await randomGenerator()
        let factorial = await factorialCounter(numbers: tuple)
        await raceOne(numbers: factorial)
    }
    
    private func taskStarter2() async {
        let tuple = await randomGenerator()
        let factorial = await factorialCounter(numbers: tuple)
        await raceTwo(numbers: factorial)
    }
    
    
}
