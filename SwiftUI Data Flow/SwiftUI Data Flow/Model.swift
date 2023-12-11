//
//  ProductModel.swift
//  SwiftUI Data Flow
//
//  Created by David on 12/10/23.
//

import SwiftUI

@Observable
class Product: Identifiable {
    
    var id = UUID()
    var name: String
    var price: Int
    var image: Image
    var quantity: Int
    
    init(id: UUID = UUID(), name: String, price: Int, image: Image, quantity: Int) {
        self.id = id
        self.name = name
        self.price = price
        self.image = image
        self.quantity = quantity
    }
    
}
