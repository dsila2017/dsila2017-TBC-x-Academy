//
//  NewsViewController.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import UIKit

final class NewsViewController: UIViewController {
    
    // MARK: - Properties
    
    //TODO: var არაა საჭირო
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "newsCell")
        return tableView
    }()
    
    //TODO: პირდაპირ რასაც აბრუნებდა იმ ტიპის შევქმენი მასივის მაგივრად
    private var news: News?
    //TODO: DefaultNew-s-ViewModel() s აკლდა და sceneDelegate-ში სხვა კლასის ინსტანსი იყო და var არაა საჭირო
    //private var viewModel: NewsViewModel = DefaultNewViewModel()
    private let viewModel = DefaultNewsViewModel()
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Setup TableView
    private func setupTableView() {
        
        //TODO: ალბათ პირდაპირ შექმნისას ჯობდა ჩაწერა
        //tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //TODO: viewModel-ის დელეგატს არ ეწერა რომ ამ კლასისაა
        viewModel.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - TableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //TODO: ნულს აბრუნებდა
        //.zero
        if news != nil {
            return news!.articles.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell else {
            fatalError("Could not dequeue NewsCell")
        }
        guard let news else {
            return cell
        }
        //TODO: +1 ზედმეტი იყო
        //cell.configure(with: news[indexPath.row + 1])
        cell.configure(with: news.articles[indexPath.row])
        return cell
    }
}

// MARK: - TableViewDelegate
extension NewsViewController: UITableViewDelegate {
    //TODO: ზედმეტია, Row-ს სიმაღლე ხდება 0
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        .zero
    //    }
}

// MARK: - NewsViewModelDelegate
extension NewsViewController: NewsViewModelDelegate {
    func newsFetched(_ news: News) {
        self.news = news
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("Api Error/Limit Reached", error)
    }
}
