//
//  Magnificcation.swift
//  Gestures
//
//  Created by David on 12/23/23.
//

import SwiftUI

struct Magnification: View {
    
    @State var scale = CGFloat.zero
    @GestureState var value = CGFloat.zero
    
    var body: some View {
        
        Image("Magnification")
            .resizable()
            .frame(width: 170, height: 200)
            .scaleEffect(1 + scale + value)
            .gesture(
                MagnificationGesture()
                    .updating($value, body: { value, state, _ in
                        state = value - 1
                    })
                    .onChanged({ value in
                        print(value)
                        scale = value - 1
                    })
            )
    }
}

#Preview {
    Magnification()
}
