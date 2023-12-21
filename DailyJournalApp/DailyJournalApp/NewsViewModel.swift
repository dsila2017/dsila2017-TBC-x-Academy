//
//  ViewModel.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

class NewsViewModel: ObservableObject {
    
    @Published var newsTitle: String = ""
    @Published var newsText: String = "Enter News Text Here"
    @Published var date = Date()
    @Published var news: [NewsModel] = []
    @Published var isOn = false
    
    
    func saveButon() {
        news.append(NewsModel(title: newsTitle, news: newsText, date: date))
        newsTitle = ""
        newsText = ""
        date = Date()
        print(news.count)
    }
    
    func checkEmptyNews() -> Bool {
        if news.isEmpty {
            true
        } else {
            false
        }
    }
}
