//
//  ViewController.swift
//  Assignment-10
//
//  Created by David on 10/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchButton(_ sender: UISwitch) {
        if sender.isOn {
            switchLabel.text = "LCM"
        } else {
            switchLabel.text = "GCM"
        }
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        if let number1 = Int(number1.text!) as? Int, let number2 = Int(number2.text!) as? Int {
            if number1 > 0 && number2 > 0 {
                self.number1.backgroundColor = .white
                self.number2.backgroundColor = .white
                resultLabel.textColor = .white
                resultLabel.text = "\(calculateResult(num1: number1, num2: number2))"
            } else { shake() }
        } else if let number1 = Int(number1.text!) as? Int {
            self.number1.backgroundColor = .white
            number2.backgroundColor = .red
            number2.shake()
        } else if let number2 = Int(number2.text!) as? Int {
            self.number2.backgroundColor = .white
            number1.backgroundColor = .red
            number1.shake()
        }
            else {
            shake()
        }
    }
    
    func CalculateLCM(num1: Int, num2: Int) -> Int {
        var result = 0
        let cgm = calculateGCM(num1: num1, num2: num2)
        let multiply = num1 * num2
        result = multiply / cgm
        return result
    }
    
    func calculateGCM(num1: Int, num2: Int) -> Int {
        var result = 1
        var lowestNumber = min(num1, num2)
        var highestNumber = max(num1, num2)
        
        for i in 1...lowestNumber {
            if lowestNumber % i == 0 && highestNumber % i == 0 {
                result = i
            }
        }
        return result
    }
    
    func calculateResult(num1: Int, num2: Int) -> Int {
        if switchLabel.text == "LCM" {
            return CalculateLCM(num1: num1, num2: num2)
        } else {
            return calculateGCM(num1: num1, num2: num2)
        }
    }
    
    func shake() {
        number1.backgroundColor = .red
        number2.backgroundColor = .red
        resultLabel.textColor = .red
        resultLabel.text = "Positive Numbers Required!"
        number1.shake()
        number2.shake()
    }
    
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
