//
//  ViewController.swift
//  UITableView
//
//  Created by David on 10/29/23.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: Views
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topNavBar, UITableView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private let topNavBar: UIView = {
        let topNavBar = UIView()
        return topNavBar
    }()
    
    private let UITableView: UITableView = {
        let UITableView = UITableView()
        return UITableView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(.add, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector (addButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var musicList = [music1, music2, music3]
    private var music1 = Music(name: "Music1", image: .init(systemName: "music.quarternote.3"))
    private var music2 = Music(name: "Music2", image: .init(systemName: "music.quarternote.3"))
    private var music3 = Music(name: "Music3", image: .init(systemName: "music.quarternote.3"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupView()
    }
    
    //MARK: Methods
    private func setupView() {
        view.addSubview(stackView)
        topNavBar.addSubview(addButton)
        viewConstraints()
        setupTableView()
        registerTableViewCells()
    }
    
    private func registerTableViewCells() {
        UITableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    }
    
    private func setupTableView(){
        UITableView.delegate = self
        UITableView.dataSource = self
    }
    
    private func viewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            addButton.centerYAnchor.constraint(equalTo: topNavBar.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: topNavBar.trailingAnchor, constant: -20),
            addButton.widthAnchor.constraint(equalTo: topNavBar.heightAnchor, multiplier: 0.5),
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor),
            
            topNavBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
    }
    
    @objc func addButtonPressed() {
        let vc = AddNewItemToListViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.name.text = musicList[indexPath.row].name
        cell.cellImageView.image = musicList[indexPath.row].image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ItemDetailsViewController()
        vc.nameLabel.text = musicList[indexPath.row].name
        vc.imageView.image = musicList[indexPath.row].image
        print(musicList[indexPath.row].name)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Favourites"
    }
}

extension MainViewController: addItem {
    func addItem(music: Music) {
        musicList.append(music)
        UITableView.reloadData()
    }
}

protocol addItem {
    func addItem(music: Music)
}

struct Music {
    var name: String
    var image: UIImage?
}

