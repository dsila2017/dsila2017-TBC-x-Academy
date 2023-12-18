//
//  selectorView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct selectorView: View {
    
    @ObservedObject var model: MainViewViewModel
    
     var product: Product
    
    var body: some View {
        HStack {
            Button(action: {
                
                
            }, label: {
                Image(systemName: "minus")
            })
            
            Text("\(product.stock)")
            
            Button(action: {
                model.increaseQuantity(product: product)
                print(product.brand)
                print(product.stock)
                
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
}

//#Preview {
//    selectorView(product: T##Product)
//}
