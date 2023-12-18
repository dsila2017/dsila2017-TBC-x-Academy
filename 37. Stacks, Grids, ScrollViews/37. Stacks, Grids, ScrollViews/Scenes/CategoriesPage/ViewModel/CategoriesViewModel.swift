//
//  CategoriesViewModel.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI
import NetworkManager

class CategoriesViewModel: ObservableObject {
    
    @Published var categories = [String]()
    
    init() {
        fetchCategoriesData()
    }
    
    private func fetchCategoriesData() {
        NetworkManager.shared.fetchData(url: "https://dummyjson.com/products/categories") { (result: Result<[String], Error>) in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self.categories = categories
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

//#Preview {
//    CategoriesViewModel()
//}
