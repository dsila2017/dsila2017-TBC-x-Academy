//
//  CategoriesViewModel.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI
import NetworkManager

class CategoriesViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var categories = [String]()
    
    // MARK: - Initialization
    init() {
        fetchCategoriesData()
    }
    
    // MARK: - Data Fetching
    func fetchCategoriesData() {
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
