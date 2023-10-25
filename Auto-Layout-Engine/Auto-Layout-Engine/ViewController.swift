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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup(drink: Tea)
    }

    @IBAction func favorite(_ sender: UIButton) {
    }
    
    var Tea = Drink(image: "Tea", productName: "Green Tea", productWith: "Jasmine", rating: 4.9, reviewCount: 40, price: 4.44, size: .M, description: "Good Tea")
    
    func setup(drink: Drink) {
        image.image = UIImage(named: drink.image)
        product.text = drink.productName
        productWith.text = "With" + " " + drink.productWith
        rating.text = String(drink.rating)
        reviewCount.text = " (\(drink.reviewCount))"
        productDescription.text = drink.description
        price.text = "$ \(drink.price)"
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
    var price: Double
    var size: Size
    var description: String
}
