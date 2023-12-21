//
//  ContentView.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var model: NewsViewModel
    
    var body: some View {
        VStack {
            
            NavigationStack {
                
                Form {
                    
                    TextField(text: $model.newsTitle) {
                        Text("News Title")
                    }
                    
                    TextView(text: $model.newsText)
                        .frame(height: 400)
                    
                    DatePicker(selection: $model.date) {
                        Text("Date: ")
                    }
                    
                    Button(action: {
                        model.saveButon()
                    }, label: {
                        Text("Save")
                            .frame(maxWidth: .infinity, alignment: .center)
                    })
                    .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
                    .background(.fill)
                    .cornerRadius(10)
                }
                .tint(Color(uiColor: .purple))
                .foregroundStyle(Color(uiColor: .purple))
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Text("Create News")
                            .font(.custom("AmericanTypewriter", fixedSize: 36).bold())
                            .foregroundStyle(Color(uiColor: .purple))
                    })
                }
                .font(.custom("AmericanTypewriter", fixedSize: 18).bold())
            }
            
            .cornerRadius(10)
            //.scrollContentBackground(.hidden)
            
        }
    }
}

#Preview {
    MainView(model: NewsViewModel())
}
