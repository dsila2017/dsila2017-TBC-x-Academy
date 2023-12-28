//
//  ViewModel.swift
//  Accessibility_UIKIToSwiftUI
//
//  Created by David on 12/28/23.
//

import SwiftUI
import NetworkManager

final class ViewModel: ObservableObject {
    
    @Published var data: Model = Model(articles: [Article(author: "Empty", title: "Empty", content: nil)])
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchData(url: "https://newsapi.org/v2/top-headlines?country=gb&category=business&apiKey=904d2b5ae9c944d8845940fbc4ff0213") { (result: Result<Model, Error>) in
            switch result {
            case.success(let model):
                DispatchQueue.main.async {
                    self.data = model
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
