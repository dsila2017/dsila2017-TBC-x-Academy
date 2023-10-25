//
//  ViewController.swift
//  Auto-Layout-Engine
//
//  Created by David on 10/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var productWith: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var selected: Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup(drink: tea)
        
    }
    
    @IBAction func selectDrink(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            setup(drink: tea)
        case 1:
            setup(drink: coffee)
        case 2:
            setup(drink: whiskey)
        default:
            break
        }
    }
    
    @IBAction func segmentSize(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            price.text = String(selected!.price)
        case 1:
            price.text = String(selected!.price * 2)
        case 2:
            price.text = String(selected!.price * 3)
        default:
            break
        }
    }
    
    @IBAction func favorite(_ sender: UIButton) {
    }
    
    var tea = Drink(image: "Tea", productName: "Green Tea", productWith: "Jasmine", rating: 4.9, reviewCount: 40, price: 4.79, size: .M, description: "Good Tea")
    var coffee = Drink(image: "coffee", productName: "coffee", productWith: "Milk", rating: 4.9, reviewCount: 140, price: 9.49, size: .M, description: "coffee")
    var whiskey = Drink(image: "whiskey", productName: "Whiskey", productWith: "Nothing", rating: 4.9, reviewCount: 70, price: 40.99, size: .M, description: "Irish Whiskey")
    
    private func setup(drink: Drink) {
        selected = drink
        image.image = UIImage(named: drink.image)
        product.text = drink.productName
        productWith.text = "With" + " " + drink.productWith
        rating.text = String(drink.rating)
        reviewCount.text = " (\(drink.reviewCount))"
        productDescription.text = drink.description
        price.text = String(selected!.price * 2)
    }
}

enum Size {
    case S, M, L
}

struct Drink {
    var image: String
    var productName: String
    var productWith: String
    var rating: Double
    var reviewCount: Int
    var price: Float
    var size: Size
    var description: String
}
