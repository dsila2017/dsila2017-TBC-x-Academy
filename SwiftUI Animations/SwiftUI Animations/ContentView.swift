  //
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by David on 12/25/23.
//

import SwiftUI
import EffectsLibrary

struct ContentView: View {
    @State var isAnimated: Bool = false
    var body: some View {
        
        ZStack {
            
            SnowView()
            
            FireworksView()
            
            VStack {
                
                Text("TBC IT Academy")
                    .scaleEffect(isAnimated ? 2 : 1)
                    .foregroundStyle(isAnimated ? .red : .blue)
                    .bold()
                    .onTapGesture {
                        isAnimated.toggle()
                    }
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimated)
                
                Tree()
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
