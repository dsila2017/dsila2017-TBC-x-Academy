//
//  ViewController.swift
//  მოდულარობა
//
//  Created by David on 11/19/23.
//

import UIKit

final class FactsViewController: UIViewController {
    
    //MARK: Private Properties
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topStackView, tableView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.setCustomSpacing(20, after: topStackView)
        return stackView
    }()
    
    private let tableView = UITableView()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleImage, mainTitle])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.setCustomSpacing(20, after: titleImage)
        return stackView
    }()
    
    private let mainTitle: UILabel = {
        let title = UILabel()
        title.text = "Cat Facts"
        title.font = UIFont.boldSystemFont(ofSize: 34)
        return title
    }()
    
    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(systemName: "cat")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let viewModel = FactsViewModel()
    private var catData = CatsModel(data: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainView()
        viewModel.didLoad()
    }
    
    //MARK: Private Methods
    func setupMainView() {
        view.addSubview(mainStackView)
        setupConstraints()
        setupTableView()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            topStackView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.1),
            
            titleImage.widthAnchor.constraint(equalTo: titleImage.heightAnchor, multiplier: 1.2),
            
        ])
    }
    
    func setupTableView() {
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setupViewModelDelegate()
    }
    
    func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

extension FactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // რამდენი გამოიტანოს აქ პირდაპირ ვიუკონტროლერის მასივიდან რო დავაბრუნო შეიძლება თუ ვიუმოდელის მეთოდით უნდა წამოვიდეს?
        guard let data = catData.data?.count else {
            return 0
        }
        return data
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let data = catData.data {
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = .byWordWrapping
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            cell.textLabel?.text = "Cat fact \(Int(indexPath.row) + 1):  \(data[indexPath.row].fact)"
        }
        return cell
    }
}

extension FactsViewController: mainViewModelDelegate {
    func notifyDataGotError(error: Error) {
        print(error)
    }
    
    func notifyDataGotFetched(CatArray: CatsModel) {
        self.catData = CatArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
