//
//  LongPressView.swift
//  Gestures
//
//  Created by David on 12/23/23.
//

import SwiftUI

struct LongPressView: View {
    
    @State var scale = CGSize(width: 1.0, height: 1.0)
    var body: some View {
        
        Image("LongPress")
            .resizable()
            .frame(width: 170, height:200)
            .scaleEffect(scale)
            .onLongPressGesture(minimumDuration: 1, perform: {
                scale = CGSize(width: 2.0, height: 2.0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    scale = CGSize(width: 1.0, height: 1.0)
                }
            })
    }
}

#Preview {
    LongPressView()
}
