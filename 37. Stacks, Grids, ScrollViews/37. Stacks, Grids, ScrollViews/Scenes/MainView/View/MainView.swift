//
//  ContentView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model: MainViewViewModel
    @State var path = NavigationPath()
    
    var gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            
            VStack {
                Balance(model: model)
                    .padding()
                ScrollView {
                    LazyVGrid(columns: gridLayout, content: {
                        ForEach(model.products.products, id: \.self) { product in
                            ProductsGridView(model: model, product: product)
                        }
                    })
                }
                Cart___Items(model: model)
                
            }
            
            
            if model.isLoading {
                ActivityView()
            }
        }
        
    }
    
}

//#Preview {
//    MainView()
//}
