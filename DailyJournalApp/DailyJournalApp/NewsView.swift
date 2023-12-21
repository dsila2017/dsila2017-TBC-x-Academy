//
//  NewsView.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var model: NewsViewModel
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                List {
                    
                    ForEach (model.news.indices, id: \.self) { news in
                        News(title: model.news[news].title, news: model.news[news].news, date: model.news[news].date, model: model)
                            .onTapGesture {
                                model.isOn.toggle()
                                model.index = news
                                
                            }.sheet(isPresented: $model.isOn) {
                                newsEditView(index: model.index, model: model)
                            }
                        
                    }.onDelete(perform: { indexSet in
                        model.news.remove(atOffsets: indexSet)
                    })
                    
                    .onMove { IndexSet, Int in
                        model.news.move(fromOffsets: IndexSet, toOffset: Int)
                    }
                }
                
                .toolbar {
                    
                    EditButton()
                        .font(.custom("AmericanTypewriter", fixedSize: 18).bold())
                        .foregroundStyle(Color(uiColor: .purple))
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
                                .font(.custom("AmericanTypewriter", fixedSize: 24).bold())
                                .foregroundStyle(Color(uiColor: .purple))
                        }
                    })
            }
        }
    }
}
