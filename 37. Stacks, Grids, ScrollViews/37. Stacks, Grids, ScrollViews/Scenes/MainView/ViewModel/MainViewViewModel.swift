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
    @Published var balance = 1000000
    @Published var sum = 0
    
    @Published var isAlertShowed = false
    @Published var isErrorAlertShowed = false
    @Published var isLoading = false
    
    
    var selectedQuantity: Int {
        products.products.reduce(0) { $0 + $1.stock }
    }
    
    init() {
        fetchProductData()
    }
    
    func fetchProductData() {
        NetworkManager.shared.fetchData(url: "https://dummyjson.com/products") { (result: Result<ProductResponse, Error>) in
            switch result {
            case.success(let products):
                DispatchQueue.main.async {
                    self.products = products
                    self.calculateSum()
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
        sum = products.products.reduce(0) { $0 + $1.stock * Int($1.price) }
    }
    
    func checkout() {
        if balance >= sum {
            balance -= sum
            isAlertShowed = true
        } else {
            isErrorAlertShowed = true
        }
    }
    
    func activity() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
            self.checkout()
        }
    }
}
