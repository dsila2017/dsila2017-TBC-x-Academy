//
//  ItemDetailsViewController.swift
//  UITableView
//
//  Created by David on 10/30/23.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, imageView ])
        stackView.axis = .vertical
        stackView.spacing = 20
        //stackView.distribution = .fillEqually
        return stackView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = .init(systemName: "photo")
        image.tintColor = .black
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        
        view.addSubview(stackView)
        viewConstraints()
    }
    
    private func viewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            imageView.heightAnchor.constraint(equalTo: imageView.heightAnchor),
            nameLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1)
            
            
            
        ])
        
    }
    
}
