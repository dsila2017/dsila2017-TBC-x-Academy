//
//  TapView.swift
//  Gestures
//
//  Created by David on 12/23/23.
//

import SwiftUI

struct TapView: View {
    
    @State var string = "Tap1"
    
    var body: some View {
        
        Image(string)
            .resizable()
            .frame(width: 170, height:200)
            .onTapGesture {
                self.string = "Tap2"
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.string = "Tap1"
                }
            }
    }
    
}


#Preview {
    TapView()
}
