//
//  ContentView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @ObservedObject var model: MainViewViewModel
    @State var path = NavigationPath()
    
    // MARK: - Grid Layout
    var gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            
            // MARK: - Vertical Stack
            VStack {
                
                // MARK: - Balance
                Balance(model: model)
                    .padding()
                
                // MARK: - Scroll View
                
                ScrollView {
                    LazyVGrid(columns: gridLayout, content: {
                        ForEach(model.products.products, id: \.self) { product in
                            ProductsGridView(model: model, product: product)
                        }
                    })
                }
                
                // MARK: - Cart Items
                Cart___Items(model: model)
                
            }
            
            // MARK: - Loading Indicator
            if model.isLoading {
                ActivityView()
            }
        }
    }
}


//#Preview {
//    MainView()
//}
