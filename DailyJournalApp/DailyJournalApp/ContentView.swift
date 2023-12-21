//
//  ContentView.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    
    var model = NewsViewModel()
    
    var body: some View {
        TabView {
            MainView(model: model)
                .tabItem {
                    Image(systemName: "iphone")
                }
            NewsView(model: model)
                .tabItem {
                    Image(systemName: "newspaper")
                }
        }
        .tint(Color(uiColor: .purple))
    }
}

#Preview {
    ContentView()
}
