//
//  MovieCell.swift
//  UICollectionView
//
//  Created by David on 11/3/23.
//

import UIKit

protocol favouriteDelegate: AnyObject {
    func favPressed(cell: MovieCell)
}

final class MovieCell: UICollectionViewCell {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, movieTitleLabel, movieGenre])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var favButton: UIButton = {
        let favButton = UIButton()
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.setImage(.init(systemName: "heart"), for: .normal)
        favButton.tintColor = .gray
        favButton.addAction(UIAction(handler: { [weak self] _ in
            self?.delegate?.favPressed(cell: self!)
        }), for: .touchUpInside)
        return favButton
    }()
    
     let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    private let movieGenre: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let rating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 4
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    private let favourite = Bool()
    
    weak var delegate: HomeViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        rating.text = nil
        rating.textColor = nil
        movieTitleLabel.text = nil
        movieGenre.text = nil
        favButton.tintColor = .gray
    }
    
    //MARK: - Methods
    func configure(model: Movie) {
        imageView.image = model.image
        movieTitleLabel.text = model.name
        movieGenre.text = "\(model.genre)"
        if model.rating >= 7 {
            rating.text = " \(model.rating) "
        } else {
            rating.backgroundColor = .gray
            rating.text = " \(model.rating) "
        }
    }
    
    func apiConfigure(model: Search) {
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: URL(string: model.poster)!)
            
            DispatchQueue.main.async { [self] in
                imageView.image = UIImage(data: data)
            }
        }
        movieTitleLabel.text = model.title
        movieGenre.text = model.year
        
        //movieGenre.text = "\(model.)"
//        if model.rating >= 7 {
//            rating.text = " \(model.rating) "
//        } else {
//            rating.backgroundColor = .gray
//            rating.text = " \(model.rating) "
//        }
//        if model.favourite == true {
//
//        }
    }
    
    //MARK: - Private Methods
    private func setupCell() {
        addSubview(stackView)
        stackView.addSubview(favButton)
        stackView.addSubview(rating)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        favButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor),
            
            imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.8),
            
            favButton.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            favButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            
            rating.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            rating.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            
        ])
    }
}
