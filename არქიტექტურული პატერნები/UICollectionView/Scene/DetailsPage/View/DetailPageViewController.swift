//
//  MovieDetailViewController.swift
//  UICollectionView
//
//  Created by David on 11/4/23.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    //MARK: - Private Properties
    let detailPageViewModel: DetailPageViewModel = DetailPageViewModel()
    
    //MARK: - Views
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, ratingStackView, descriptionLabel, detailsStackView, selectSession])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.setCustomSpacing(10, after: imageView)
        stackView.setCustomSpacing(70, after: detailsStackView)
        return stackView
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ratingLabel, ratingStaticLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.4"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let ratingStaticLabel: UILabel = {
        let label = UILabel()
        label.text = "IMDB"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftDetailsStackView, rightDetailsStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var leftDetailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [certificateLabel, runtimeLabel, releaseLabel, genreLabel, directorLabel, castLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var rightDetailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [certificateResultLabel, runtimeResultLabel, releaseResultLabel, genreResultLabel, directorResultLabel, castResultLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let certificateLabel: UILabel = {
        let label = UILabel()
        label.text = "Certificate"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let runtimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Runtime"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.text = "Release"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Genre"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "Director"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let certificateResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let runtimeResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let releaseResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let genreResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let directorResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let castResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var selectSession: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Session", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.addAction(UIAction(handler: { [weak self] _ in
            print("Hello")
        }), for: .touchUpInside)
        button.backgroundColor = .orange
        return button
    }()
    
    var mainNavBarTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
    }
    
    //MARK: - Methods
    func apiConfigure(with: JsonMovie) {
        mainNavBarTitle.text = with.Title
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: with.Poster ?? "Photo Fetching Error")!) {
                DispatchQueue.main.async { [self] in
                    imageView.image = UIImage(data: data)
                }
            } else {
                print("URL Error")
            }
        }
        ratingLabel.text = with.imdbRating
        descriptionLabel.text = with.Plot
        certificateResultLabel.text = with.Rated
        runtimeResultLabel.text = with.Runtime
        releaseResultLabel.text = with.Year
        genreResultLabel.text = with.Genre
        directorResultLabel.text = with.Director
        castResultLabel.text = with.Actors
    }
    
    //MARK: - Private Methods
    private func setupMainView() {
        view.backgroundColor = UIColor(rgb: 0x1A2232)
        setupNavBar()
        view.addSubview(mainStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            leftDetailsStackView.widthAnchor.constraint(equalTo: detailsStackView.widthAnchor, multiplier: 0.3),
            
            imageView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.3),
            ratingStackView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.1),
            descriptionLabel.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.12),
            detailsStackView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.3),
            
        ])
    }
    
    private func setupNavBar() {
        navigationItem.title = mainNavBarTitle.text
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .white
    }
}
