//
//  ViewModel.swift
//  SwiftUI Data Flow
//
//  Created by David on 12/10/23.
//

import SwiftUI

protocol viewModelDelegate: AnyObject {
    var products: [Product] { get set }
    var discounted: Bool { get set }
    func addQuantity(product: Product)
    func removeQuantity(product: Product)
    func deleteProduct(product: Product)
    func productsTotal(product: Product) -> Int
    func calculateShipping() -> Int
    func subtotal() -> Int
    func calculateTotal() -> Int
    func discount()
}

@Observable
class ViewModel: viewModelDelegate {
    
    internal var products = [
        
        Product(name: "Apple", price: 10, image: Image("Apple"), quantity: 0, stock: 10),
        Product(name: "Banana", price: 20, image: Image("Banana"), quantity: 0, stock: 10),
        Product(name: "Orange", price: 30, image: Image("Orange"), quantity: 0, stock: 10),
        Product(name: "Mango", price: 40, image: Image("Mango"), quantity: 0, stock: 10),
        Product(name: "Grapes", price: 50, image: Image("Grapes"), quantity: 0, stock: 10),
        Product(name: "Pineapple", price: 60, image: Image("Pineapple"), quantity: 0, stock: 10),
        Product(name: "Pomegranate", price: 70, image: Image("Pomegranate"), quantity: 0, stock: 10),
        Product(name: "Watermelon", price: 80, image: Image("Watermelon"), quantity: 0, stock: 10)
        
    ]
    
    internal var discounted = false
    
    internal func removeLast() {
        if products.count > 0 {
            products.removeLast()
        }
    }
    
    internal func addQuantity(product: Product) {
        if product.quantity < product.stock {
            product.quantity += 1
        }
    }
    
    internal func removeQuantity(product: Product) {
        if product.quantity > 0 {
            product.quantity -= 1
        }
    }
    
    internal func deleteProduct(product: Product) {
        products.removeAll(where: {$0.name == product.name})
    }
    
    internal func productsTotal(product: Product) -> Int {
        Int(product.price) * product.quantity
    }
    
    internal func subtotal() -> Int {
        var subtotal = 0
        for product in products {
            subtotal += productsTotal(product: product)
        }
        return subtotal
    }
    
    internal func calculateShipping() -> Int {
        var count = 0
        for product in products {
            count += product.quantity
        }
        if count <= 10 {
            return 4
        } else {
            return 9
        }
    }
    
    internal func calculateTotal() -> Int {
        return subtotal() + calculateShipping()
    }
    
    internal func discount() {
        if discounted == false {
            for product in products {
                product.price /= 2
            }
            discounted = true
        }
    }
}
