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
        Product(name: "Product1", price: 4.99, image: Image(systemName: "mug"), quantity: 10),
        Product(name: "Product2", price: 4.99, image: Image(systemName: "calendar"), quantity: 10),
        Product(name: "Product3", price: 4.99, image: Image(systemName: "mug"), quantity: 10),
        Product(name: "Product4", price: 4.99, image: Image(systemName: "calendar"), quantity: 10)
    ]
    
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
    
    func subtotal() {
//        products.reduce(0) { partialResult, product in
//            partialResult += product.price
//        }
    }
}
