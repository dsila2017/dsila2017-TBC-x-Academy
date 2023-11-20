//
//  BreedsViewController.swift
//  მოდულარობა
//
//  Created by David on 11/20/23.
//

import Foundation
import UIKit

final class BreedsViewController: UIViewController {
    
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
        title.text = "Cat Breeds"
        title.font = UIFont.boldSystemFont(ofSize: 34)
        return title
    }()
    
    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(systemName: "pawprint")
        imageView.tintColor = .black
        return imageView
    }()
    
    let viewModel = BreedViewModel()
    var breedsArray = CatsBreedModel(data: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainView()
        setupConstraints()
        
        viewModel.viewDidLoad()
    }
    
    //MARK: Private Methods
    func setupMainView() {
        view.addSubview(mainStackView)
        setupTableview()
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
    
    func setupTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        viewModelDelegate()
    }
    
    func viewModelDelegate() {
        viewModel.delegate = self
    }
}

extension BreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = breedsArray.data?.count {
            return data
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cat Breeds"
        if let data = breedsArray.data {
            cell.textLabel?.text = data[indexPath.row].breed
        }
        return cell
    }
}

extension BreedsViewController: UITableViewDelegate {
    
}

extension BreedsViewController: BreedViewModelDelegate {
    func notifyFetchedData(breeds: CatsBreedModel) {
        self.breedsArray = breeds
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func notifyFetchedError(error: Error) {
        print(error)
    }
}
