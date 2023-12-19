//
//  Cart + Items.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct Cart___Items: View {
    
    // MARK: - Properties
    @ObservedObject var model: MainViewViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Image(systemName: "cart")
                
                Spacer()
                
                Text("\(model.selectedQuantity)")
                
            }
            .padding(.horizontal, 70)
            
            HStack {
                Text("Total Price")
                
                Spacer()
                
                Text("\(model.sum)")
                
            }
            .padding(.leading, 40)
            .padding(.trailing, 70)
            
            Spacer()
            
            Button(action: {
                model.activity()
            }, label: {
                Text("Checkout")
            })
            
            .alert("Success", isPresented: $model.isAlertShowed) {
                
            }message: {
                Text("Order Confirmed")
            }
            
            .alert("Sorry", isPresented: $model.isErrorAlertShowed) {
                
            }message: {
                Text("You aren't rich 😭")
            }
            .tint(.red)
            .buttonStyle(.bordered)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(.teal)
        .foregroundColor(.white)
        .bold()
    }
}
