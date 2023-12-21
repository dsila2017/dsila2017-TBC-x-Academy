//
//  ViewModel.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

class NewsViewModel: ObservableObject {
    
    // MARK: - Published Properties]
    @Published var newsTitle: String = ""
    @Published var newsText: String = "Enter News Text Here"
    @Published var date = Date()
    @Published var news: [NewsModel] = []
    @Published var isOn = false
    @Published var index: Int = 0
    @Published var categories: [String] = ["General", "Sports", "Economics", "Technology"]
    @Published var selectedCategory: String = ""
    
    // MARK: - Methods
    func saveButon() {
        news.append(NewsModel(title: newsTitle, news: newsText, date: date, category: selectedCategory))
        newsTitle = ""
        newsText = "Enter News Text Here"
        date = Date()
    }
    
    func checkEmptyNews() -> Bool {
        if news.isEmpty {
            true
        } else {
            false
        }
    }
    
    func addFavourite(index: Int) {
        news[index].isFavourite.toggle()
        print(news[index].isFavourite)
    }
    
    func checkFavourite(index: Int) -> Bool {
        news[index].isFavourite
    }
    
    func editSaveButton(index: Int) {
        news[index].category = selectedCategory
    }
}
