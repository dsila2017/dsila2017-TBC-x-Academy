//
//  Balance.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct Balance: View {
    
    // MARK: - Properties
    @ObservedObject var model: MainViewViewModel
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text("Your Balance is: \(model.balance) $")
                .font(.subheadline.bold())
                .foregroundStyle(.white)
                .padding()
                .background(.teal)
                .cornerRadius(10)
            
            Spacer()
            
        }
    }
}
