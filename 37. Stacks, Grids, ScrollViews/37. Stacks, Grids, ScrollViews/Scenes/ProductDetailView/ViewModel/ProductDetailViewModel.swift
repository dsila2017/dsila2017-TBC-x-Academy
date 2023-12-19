//
//  ProductDetailViewModel.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/19/23.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject {
    
    @Binding var path: NavigationPath
    @Published var product: Product
    
    init(path: Binding<NavigationPath>, product: Product) {
        self._path = path
        self.product = product
    }
    
}
