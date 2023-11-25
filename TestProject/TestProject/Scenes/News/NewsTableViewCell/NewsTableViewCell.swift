//
//  NewsTableViewCell.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import UIKit
import Kingfisher

//TODO: UITableViewCell, UICollectionViewCell-ის მაგივრად
final class NewsTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    //TODO: var არაა საჭირო
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //TODO: ზედმეტია, mainStackView-ს უწერია და ეს ამ StackView-შია
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 117).isActive = true
        return imageView
    }()
    
    //TODO: var არაა საჭირო
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        //TODO: ზედმეტია, mainStackView-ს უწერია და ეს ამ StackView-შია
        //label.translatesAutoresizingMaskIntoConstraints = false
        //TODO: დამალული იყო
        //label.isHidden = true
        return label
    }()
    
    //TODO: var არაა საჭირო
    private let newsAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        //TODO: ზედმეტია, mainStackView-ს უწერია და ეს ამ StackView-შია
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [newsTitleLabel, newsAuthorLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        //TODO: ზედმეტია, mainStackView-ს უწერია და ეს ამ StackView-შია
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [newsImageView, textStackView])
        //TODO: ზედმეტია, default-ად ჰორიზონტალურია
        //stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    //TODO: დავამატე
    override func prepareForReuse() {
        super.prepareForReuse()
        
        newsImageView.image = nil
        newsTitleLabel.text = nil
        newsAuthorLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupSubviews() {
        contentView.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //TODO: Leading, Trailing, Bottom არასწორად ეწერა
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Configure
    
    //TODO: Private ვერ იქნება, კონტროლერი უნდა მიწვდეს ამ ფუნქციას
    func configure(with news: Article) {
        
        //TODO: KingFisher-ს ბევრი მემორი მიქონდა, იქეშება სურათები და NetworkManager-ში დავამატე სურათების წამოღების მეთოდი
        //        let url = URL(string: news.urlToImage ?? "")
        //        newsImageView.kf.setImage(with: url)
        setImage(from: news.urlToImage ?? "")
        newsTitleLabel.text = news.title
        newsAuthorLabel.text = news.author
    }
    
    //TODO: დავამატე
    private func setImage(from url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.newsImageView.image = image
            }
        }
    }
}
