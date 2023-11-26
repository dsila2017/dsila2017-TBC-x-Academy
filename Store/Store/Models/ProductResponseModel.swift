//
//  ProductResponseModel.swift
//  Store
//
//  Created by Baramidze on 25.11.23.
//

import Foundation

class ProductResponseModel: Codable {
    let products: [ProductModel]
    let total: Int
    let skip: Int
    let limit: Int
}
