//
//  ContentView.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = NewsViewModel()
    
    init() {
        // Large Navigation Title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
    }
    
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    TextField(text: $model.newsTitle) {
                        Text("News Title")
                    }
                    TextView(model: model)
                        .frame(height: 100)
                    DatePicker(selection: $model.date) {
                        Text("Date")
                    }
                    Button(action: {
                        model.saveButon()
                    }, label: {
                        Text("Save")
                    })
                    .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
                    .tint(.black)
                    .background(.fill)
                    .cornerRadius(10)
                    
                    
                    //                .multilineTextAlignment(.center)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Text("Create News")
                            .font(.custom("AmericanTypewriter", fixedSize: 36).bold())
                            .foregroundStyle(Color(uiColor: .purple))
                    })
                }
            }
            .cornerRadius(10)
            //.scrollContentBackground(.hidden)
            NavigationStack {
                
                ZStack {
                    
                    List {
                        ForEach (model.news) { news in
                            Text(news.title)
                            
                        }.onDelete(perform: { indexSet in
                            model.news.remove(atOffsets: indexSet)
                        })
                        .onMove { IndexSet, Int in
                            model.news.move(fromOffsets: IndexSet, toOffset: Int)
                        }
                    }
                    .toolbar {
                        EditButton()
                    }
                    
                    .toolbar{
                        
                        ToolbarItem(placement: .topBarLeading) {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .foregroundStyle(Color(uiColor: .purple))
                                .scaledToFit()
                                .frame(width: 24)
                        }
                        
                        ToolbarItem(placement: .topBarLeading) {
                            Text("News")
                                .font(.custom("AmericanTypewriter", fixedSize: 36).bold())
                                .foregroundStyle(Color(uiColor: .purple))
                        }
                    }.navigationBarTitleDisplayMode(.inline)
                        .overlay(Group {
                            if model.checkEmptyNews() {
                                Text(" 📰 Looks like theres no News for now.")
                                    .font(.custom("AmericanTypewriter", fixedSize: 24))
                                    .foregroundStyle(Color(uiColor: .purple))
                            }
                        })
                    
                }
            }
        }
        
        //.padding()
    }
}

#Preview {
    ContentView()
}
