//
//  MainViewModel.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI
import NetworkManager


class MainViewViewModel: ObservableObject {
    
    @Published var products = ProductResponse(products: [Product]())
    @Published var balance = 1000
    @Published var sum = 0
    
    init() {
        fetchProductData()
    }
    
    func fetchProductData() {
        NetworkManager.shared.fetchData(url: "https://dummyjson.com/products") { (result: Result<ProductResponse, Error>) in
            switch result {
            case.success(let products):
                DispatchQueue.main.async {
                    self.products = products
                }
            case.failure(let failure):
                print(failure)
            }
        }
    }
    
    func increaseQuantity( product: Product) {
        
        //product.stock += 1
        calculateSum()
        balance -= 100
        print(sum)
        print(balance)
        
    }
    
    func calculateSum() {
        var sum = 0
        for product in products.products {
            sum += product.stock * Int(product.price)
        }
        self.sum = sum
    }
}
