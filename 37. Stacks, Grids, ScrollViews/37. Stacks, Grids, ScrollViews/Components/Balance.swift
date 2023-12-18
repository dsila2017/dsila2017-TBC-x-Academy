//
//  Balance.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct Balance: View {
    
    @ObservedObject var model: MainViewViewModel
    
    var body: some View {
        HStack {
            Text("Your Balance is: \(model.balance) $")
                .font(.subheadline.bold())
                .foregroundStyle(.white)
                .padding()
                .background(.teal)
                .cornerRadius(10)
                //.frame(maxWidth: 200)
            
            Spacer()
        }
    }
}

//#Preview {
//    Balance(balance: 10)
//}
