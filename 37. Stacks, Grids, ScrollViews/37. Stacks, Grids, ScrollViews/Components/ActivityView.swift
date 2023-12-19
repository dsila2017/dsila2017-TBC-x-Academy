//
//  ActivityView.swift
//  37. Stacks, Grids, ScrollViews
//
//  Created by David on 12/19/23.
//

import SwiftUI

struct ActivityView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(3)
        }
    }
}
