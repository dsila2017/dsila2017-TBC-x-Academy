//
//  ProductModel.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct ProductResponse: Decodable, Hashable {
    let products: [Product]
}

struct Product: Decodable, Hashable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    var stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
