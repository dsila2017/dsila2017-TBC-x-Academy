//
//  Cart + Items.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/18/23.
//

import SwiftUI

struct Cart___Items: View {
    
    @ObservedObject var model: MainViewViewModel
    
    var body: some View {
        Text("\(model.sum)")
    }
}

//#Preview {
//    Cart___Items()
//}
