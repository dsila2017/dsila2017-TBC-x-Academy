//
//  contentView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/19/23.
//

import SwiftUI

struct contentsView: View {
    
    // MARK: - Properties
    var model = MainViewViewModel()
    
    // MARK: - Body
    var body: some View {
        TabView {
            MainView(model: model)
                .tabItem {
                    Image(systemName: "iphone")
                }
                .tint(.teal)
            CategoriesView(mainViewModel: model)
                .tabItem {
                    Image(systemName: "iphone.sizes")
                }
                .tint(.teal)
        }
        .tint(.white)
        .onAppear() {
            UITabBar.appearance().backgroundColor = .systemTeal
            UITabBar.appearance().barTintColor = .systemTeal
        }
    }
}
