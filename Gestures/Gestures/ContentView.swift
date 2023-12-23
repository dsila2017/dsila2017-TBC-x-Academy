//
//  ContentView.swift
//  Gestures
//
//  Created by David on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TapView()
                .tabItem {
                    Image(systemName: "paintbrush")
                }
            DragView()
                .tabItem {
                    Image(systemName: "paintbrush.pointed")
                }
            LongPressView()
                .tabItem {
                    Image(systemName: "paintpalette")
                }
            RotationView()
                .tabItem {
                    Image(systemName: "pencil")
                }
            Magnification()
                .tabItem {
                    Image(systemName: "photo")
                }
        }
        .tint(.purple)
    }
}

#Preview {
    ContentView()
}
