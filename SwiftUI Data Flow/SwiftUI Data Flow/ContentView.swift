//
//  ContentView.swift
//  SwiftUI Data Flow
//
//  Created by David on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                listView(model: ViewModel())
                CartView(model: ViewModel())
            }
            
            .navigationTitle("Products")
        }
    }
    
}

struct listView: View {
    
    var model: ViewModel
    
    var body: some View {
        
        
        ForEach(model.products) { product in
            ProductView(viewModel: model, product: product)
        }
    }
}

struct ProductView: View {
    
    var viewModel: ViewModel
    var product: Product
    var body: some View {
        HStack {
            product.image
                .resizable()
                .frame(maxWidth: 70.0, maxHeight: 70.0, alignment: .leading)
                .padding()
            
            Spacer()
            
            VStack {
                Text(product.name)
                Text("\(product.price)")
                
                Spacer()
                
                HStack {
                    Button(action: {
                        viewModel.addQuantity(product: product)
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.green)
                    })
                    
                    Text("\(product.quantity)")
                    
                    Button(action: {
                        viewModel.removeQuantity(product: product)
                    }, label: {
                        Image(systemName: "minus")
                            .foregroundStyle(.green)
                    })
                }
                
            }
            .padding()
            
            Spacer()
            
            VStack {
                Text("\(product.price * Double(product.quantity))")
                
                Spacer()
                
                Button(action: {
                    viewModel.deleteProduct(product: product)
                }, label: {
                    Image(systemName: "x.square")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.red)
                })
            }
            .padding()
        }
        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
        .background(.yellow)
        .cornerRadius(10)
        .padding(10)
        
    }
}

struct CartView: View {
    var model: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Subtotal: ")
                //Text
            }
        }
    }
}

#Preview {
    ContentView()
}
