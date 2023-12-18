//
//  CategoriesView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var model = CategoriesViewModel()
    @State var path = NavigationPath()
    
    var body: some View {
        List(model.categories, id: \.self) { category in
            Text("\(category)")
        }
    }
}

#Preview {
    CategoriesView()
}
