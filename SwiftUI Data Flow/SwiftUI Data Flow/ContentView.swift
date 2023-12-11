//
//  ContentView.swift
//  SwiftUI Data Flow
//
//  Created by David on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let model = ViewModel()
        NavigationStack{
            VStack {
                listView(model: model)
                CartView(model: model)
            }
            .background(.white)
            .navigationTitle("Products")
        }
    }
}

struct listView: View {
    
    var model: ViewModel
    
    var body: some View {
        ScrollView {
            ForEach(model.products) { product in
                ProductView(viewModel: model, product: product)
            }
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
                Text("\(product.price) $")
                
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
                Text("\(viewModel.productsTotal(product: product)) $")
                
                Spacer()
                
                Button(action: {
                    viewModel.deleteProduct(product: product)
                }, label: {
                    Image(systemName: "x.square")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.gray)
                })
            }
            .padding()
        }
        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
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
                
                Spacer()
                
                Text("\(model.subtotal()) $")
            }
            .padding(.horizontal, 20)
            
            HStack {
                Text("Shipping: ")
                
                Spacer()
                
                Text("\(model.calculateShipping()) $")
            }
            .padding(.horizontal, 20)
            
            Image("Line")
                .resizable()
                .padding(10)
                .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22)
            
            Button(action: {
                model.discount()
            }, label: {
                Text("Discount 50%")
                    .tint(.black)
            })
            HStack {
                Text("Total: ")
                
                Spacer()
                
                Text("\(model.calculateTotal()) $")
            }
            
            .padding(.horizontal, 20)
        }
        .frame(maxHeight: 100)
        .padding()
    }
}

#Preview {
    ContentView()
}
