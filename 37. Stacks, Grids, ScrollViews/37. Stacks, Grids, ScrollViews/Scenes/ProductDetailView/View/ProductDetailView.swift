//
//  ProductDetailView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/19/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - Properties
    var model: ProductDetailViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: model.product.thumbnail)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                
            } placeholder: {
                Color.gray
            }
            .frame(maxWidth: .infinity)
            
            Text("\(model.product.brand)")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: {
                model.backButton()
            }, label: {
                Text("Go Back To Categories")
            })
            .tint(.teal)
            .buttonStyle(.bordered)
        }
        .padding()
        .cornerRadius(10)
    }
}
