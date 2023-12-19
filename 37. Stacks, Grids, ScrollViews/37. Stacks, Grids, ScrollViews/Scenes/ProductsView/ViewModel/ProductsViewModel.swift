//
//  ViewModel.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI
import NetworkManager

class ProductsViewModel: ObservableObject {
    
    // MARK: - Properties
    @Binding var path: NavigationPath
    var category: String
    @Published var array = ProductResponse(products: [Product]())
    
    // MARK: - Initialization
    init(path: Binding<NavigationPath>, category: String) {
        self._path = path
        self.category = category
        fetchData()
    }
    
    
    // MARK: - Methods
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
