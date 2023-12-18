//
//  ContentView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var model = MainViewViewModel()
    
    private var gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            Balance(model: model)
            ScrollView {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(model.products.products, id: \.self) { product in
                        ProductsGridView(model: model, product: product)
                    }
                })
                
            }
            
            Cart___Items(model: model)
        }
        .padding()
    }
}

#Preview {
    MainView()
}
