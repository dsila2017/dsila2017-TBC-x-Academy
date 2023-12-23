//
//  RotationVIew.swift
//  Gestures
//
//  Created by David on 12/23/23.
//

import SwiftUI

struct RotationView: View {
    
    @State var value: Angle = .zero
    @GestureState var state: Angle = .zero
    
    var body: some View {
        
        Image("Rotation")
            .resizable()
            .frame(width: 170, height: 200)
            .rotationEffect(value + state)
            .gesture(
                RotationGesture()
                    .updating($state, body: { Angle, State, _ in
                        State = Angle
                    })
                    .onChanged { value += $0 }
            )
    }
}

#Preview {
    RotationView()
}
