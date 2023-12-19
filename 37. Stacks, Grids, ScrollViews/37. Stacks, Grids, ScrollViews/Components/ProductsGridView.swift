//
//  ProductsGridView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct ProductsGridView: View {
    
    @ObservedObject var model: MainViewViewModel
    
    var product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 140)
            
            Text("\(product.brand)")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            selectorView(model: model, product: product)
                
        }
        .padding()
        .frame(maxWidth: 240, maxHeight: 240)
        .cornerRadius(10)
    }
        
}

#Preview {
    ProductsGridView(model: MainViewViewModel(), product: Product(id: 10, title: "1", description: "1", price: 14.0, discountPercentage: 2, rating: 2.0, stock: 4, brand: "iPhone 9", category: "x", thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg", images: ["https://i.dummyjson.com/data/products/1/thumbnail.jpg"]))
}
