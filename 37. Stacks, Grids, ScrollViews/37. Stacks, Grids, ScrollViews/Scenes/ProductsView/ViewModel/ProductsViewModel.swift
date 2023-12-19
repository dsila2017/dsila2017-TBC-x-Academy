//
//  ViewModel.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI
import NetworkManager

class ProductsViewModel: ObservableObject {
    @Binding var path: NavigationPath
    var category: String
    @Published var array = ProductResponse(products: [Product]())
    
    init(path: Binding<NavigationPath>, category: String) {
        self._path = path
        self.category = category
        fetchData()
    }
    
    func fetchData() {
        NetworkManager.shared.fetchData(url: "https://dummyjson.com/products/category/\(category)") { (result: Result<ProductResponse, Error>) in
            switch result {
            case.success(let products):
                DispatchQueue.main.async {
                    self.array = products
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
    
}
