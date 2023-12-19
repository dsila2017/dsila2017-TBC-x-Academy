//
//  ProductDetailViewModel.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/19/23.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    @Binding var path: NavigationPath
    @Published var product: Product
    
    // MARK: - Initialization
    init(path: Binding<NavigationPath>, product: Product) {
        self._path = path
        self.product = product
    }
    
    // MARK: - Back Button Action
    func backButton() {
        path = NavigationPath()
    }
}
