//
//  NewsViewModel.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

//TODO: AnyObject
protocol NewsViewModelDelegate: AnyObject {
    func newsFetched(_ news: News)
    func showError(_ error: Error)
}

protocol NewsViewModel {
    var delegate: NewsViewModelDelegate? { get set }
    func viewDidLoad()
}

final class DefaultNewsViewModel: NewsViewModel {
    
    // MARK: - Properties
    
    //TODO: არასწორი თარიღი იყო
    private let newsAPI = "https://newsapi.org/v2/everything?q=tesla&from=2023-11-11&sortBy=publishedAt&apiKey=904d2b5ae9c944d8845940fbc4ff0213"
    
    private var newsList = [Article]()
    
    //TODO: weak var
    weak var delegate: NewsViewModelDelegate?
    
    // MARK: - Public Methods
    func viewDidLoad() {
        fetchNews()
    }
    
    // MARK: - Private Methods
    private func fetchNews() {
        
        NetworkManager.shared.get(url: newsAPI) { [weak self] (result: Result<News, Error>) in
            switch result {
            case .success(let article):
                print(article.articles.count)
                self?.delegate?.newsFetched(article)
                self?.newsList = article.articles
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
