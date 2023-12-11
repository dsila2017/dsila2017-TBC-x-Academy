//
//  ViewModel.swift
//  SwiftUI Data Flow
//
//  Created by David on 12/10/23.
//

import SwiftUI

@Observable
class ViewModel {
    var products = [
        Product(name: "Apple", price: 10, image: Image("Apple"), quantity: 10),
        Product(name: "Banana", price: 20, image: Image("Banana"), quantity: 10),
        Product(name: "Orange", price: 30, image: Image("Orange"), quantity: 10),
        Product(name: "Mango", price: 40, image: Image("Mango"), quantity: 10),
        Product(name: "Grapes", price: 50, image: Image("Grapes"), quantity: 10),
        Product(name: "Pineapple", price: 60, image: Image("Pineapple"), quantity: 10),
        Product(name: "Pomegranate", price: 70, image: Image("Pomegranate"), quantity: 10),
        Product(name: "Watermelon", price: 80, image: Image("Watermelon"), quantity: 10)
    ]
    
    var discounted = false
    
    func removeLast() {
        if products.count > 0 {
            products.removeLast()
        }
    }
    
    func addQuantity(product: Product) {
        product.quantity += 1
    }
    
    func removeQuantity(product: Product) {
        product.quantity -= 1
    }
    
    func deleteProduct(product: Product) {
        products.removeAll(where: {$0.name == product.name})
    }
    
    func productsTotal(product: Product) -> Int {
        Int(product.price) * product.quantity
    }
    
    func subtotal() -> Int {
        var subtotal = 0
        for product in products {
            subtotal += productsTotal(product: product)
        }
        return subtotal
    }
    
    func calculateShipping() -> Int {
        var count = 0
        for product in products {
            count += product.quantity
        }
        if count <= 90 {
            return 4
        } else {
            return 9
        }
    }
    
    func calculateTotal() -> Int {
        return subtotal() + calculateShipping()
    }
    
    func discount() {
        if discounted == false {
            for product in products {
                product.price /= 2
            }
            discounted = true
        }
    }
}
