//
//  ViewController.swift
//  UICollectionView
//
//  Created by David on 11/3/23.
//

import UIKit

final class HomePageViewController: UIViewController {
    
    //MARK: - Private Properties
    private let homePageViewModel: HomePageViewModel = HomePageViewModel()
    
    //MARK: - Private Views
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [collectionViewTitle, mainCollectionView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let collectionViewTitle: UILabel = {
        let label = UILabel()
        label.text = "Now in cinemas"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(rgb: 0x1A2232)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0x1A2232)
        setupNavBar()
        setupMainView()
        homePageViewModel.fetchMovies {
            DispatchQueue.main.async {
                self.mainCollectionView.reloadData()
            }
        }
    }
    
    //MARK: - Private Methods
    private func setupNavBar() {
        let rightButton = UIButton()
        rightButton.setTitle("  Profile  ", for: .normal)
        rightButton.backgroundColor = .orange
        rightButton.layer.cornerRadius = 4
        rightButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "Ticket"), for: .normal)
        leftButton.layer.cornerRadius = 4
        leftButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        let leftNavBarButton = UIBarButtonItem(customView: leftButton)
        let rightNavBarButton = UIBarButtonItem(customView: rightButton)
        
        navigationItem.setLeftBarButton(leftNavBarButton, animated: true)
        navigationItem.setRightBarButton(rightNavBarButton, animated: true)
    }
    
    private func setupMainView() {
        view.addSubview(mainStackView)
        setupConstraints()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            collectionViewTitle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
            
        ])
    }
}

extension HomePageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homePageViewModel.numberOfItemsInSection()
    }
}

extension HomePageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = homePageViewModel.movies[indexPath.row]
        if let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MovieCell {
            cell.apiConfigure(model: movie)
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.size.width - 30 * 2 ) / 2 , height: (UIScreen.main.bounds.size.width - 30 * 2 ) / 2 * 1.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieDetailViewController()
        vc.detailPageViewModel.fetchMovie(url: Search.movies[indexPath.row].imdbID) {
            DispatchQueue.main.async {
                vc.apiConfigure(with: vc.detailPageViewModel.movie)
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomePageViewController: favouriteDelegate {
    func favPressed(cell: MovieCell) {
        if let indexPath = mainCollectionView.indexPath(for: cell) {
            if Search.movies[indexPath.row].favourite == true {
                cell.favButton.tintColor = .gray
                cell.favButton.setImage(.init(systemName: "heart"), for: .normal)
                Search.movies[indexPath.row].favourite = false
            } else {
                cell.favButton.tintColor = .red
                cell.favButton.setImage(.init(systemName: "heart.fill"), for: .normal)
                Search.movies[indexPath.row].favourite = true
            }
        }
    }
}
