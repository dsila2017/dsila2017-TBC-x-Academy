//
//  selectorView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct selectorView: View {
    
    // MARK: - Properties
    @ObservedObject var model: MainViewViewModel
    var product: Product
    
    // MARK: - Body
    var body: some View {
        HStack {
            
            Button(action: {
            }, label: {
                Image(systemName: "minus")
            })
            
            Text("\(product.stock)")
            
            Button(action: {
                model.increaseQuantity(product: product)
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
}
