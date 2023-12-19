//
//  ProductsView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var model: ProductsViewModel
    @ObservedObject var mainViewModel: MainViewViewModel
    
    var gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Balance(model: mainViewModel)
                    .padding()
                ScrollView {
                    LazyVGrid(columns: gridColumns, content: {
                        ForEach(model.array.products, id: \.self) { product in
                            ProductsGridView(model: mainViewModel, product: product)
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

//#Preview {
//    ProductsView()
//}
