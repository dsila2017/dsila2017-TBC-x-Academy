//
//  CategoriesView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct CategoriesView: View {
    
    // MARK: - Properties
    @StateObject var model = CategoriesViewModel()
    @ObservedObject var mainViewModel: MainViewViewModel
    @State var path = NavigationPath()
    
    // MARK: - Body
    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                
                List(model.categories, id: \.self) { category in
                    NavigationLink(value: category) {
                        Text("\(category)")
                    }
                }
                .navigationDestination(for: String.self) { category in
                    ProductsView(model: ProductsViewModel(path: $path, category: category), mainViewModel: mainViewModel)
                }
            }
        }
    }
}
