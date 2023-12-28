//
//  ContentView.swift
//  Accessibility_UIKIToSwiftUI
//
//  Created by David on 12/28/23.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @StateObject var model = ViewModel()
    @State var toggle: Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("News")
                    .font(.title.bold())
                    .minimumScaleFactor(dynamicTypeSize == .large ? 0.8 : 0.5)
                
                    .accessibilityAddTraits(.isHeader)
                
                Toggle("", isOn: $toggle)
                    .accessibilityLabel(toggle ? "Color Scheme is Dark" : "Color Scheme is Light")
                    .accessibilityHint("Double Tap to change")
                    .accessibilityValue("")
                    .accessibilityAction {
                        toggle.toggle()
                    }
                    .accessibilityRemoveTraits(.isButton)
                    .accessibilityRemoveTraits(.isToggle)
                    
            }
            UIKitTableView(model: model)
            
            Button(action: {
                model.data.articles.append(Article(author: nil, title: "New News", content: nil))
            }, label: {
                Text("Add News")
                    .bold()
            })
        }
        .preferredColorScheme(toggle ? .dark : .light)
        .padding()
    }
}

#Preview {
    MainView()
}
