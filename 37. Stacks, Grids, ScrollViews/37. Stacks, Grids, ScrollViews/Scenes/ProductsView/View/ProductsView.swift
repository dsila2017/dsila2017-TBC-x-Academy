//
//  ProductsView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct ProductsView: View {
    
    // MARK: - Properties
    @ObservedObject var model: ProductsViewModel
    @ObservedObject var mainViewModel: MainViewViewModel
    
    var gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                Balance(model: mainViewModel)
                    .padding()
                ScrollView {
                    LazyVGrid(columns: gridColumns, content: {
                        ForEach(model.array.products, id: \.self) { product in
                            NavigationLink(value: product) {
                                ProductsGridView(model: mainViewModel, product: product)
                            }
                        }
                        .navigationDestination(for: Product.self) { product in
                            ProductDetailView(model: ProductDetailViewModel(path: model.$path, product: product))
                        }
                    })
                }
                Cart___Items(model: mainViewModel)
            }
            if mainViewModel.isLoading {
                ActivityView()
            }
        }
    }
}
