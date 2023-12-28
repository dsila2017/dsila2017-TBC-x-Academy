//
//  CustomCell.swift
//  Accessibility_UIKIToSwiftUI
//
//  Created by David on 12/28/23.
//

import UIKit

final class CustomCell: UITableViewCell {
    
    lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [headLine, newsText])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private var headLine: UILabel = {
        let headline = UILabel()
        headline.text = ""
        headline.font = .boldSystemFont(ofSize: 18)
        
        return headline
    }()
    
    private var newsText: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = .boldSystemFont(ofSize: 14)
        return textView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureCell(model: Article) {
        self.headLine.text = model.author
        self.newsText.text = model.title
    }
    
    private func setupCell() {
        addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //newsText.heightAnchor.constraint(greaterThanOrEqualToConstant: 100.0)
            newsText.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
            
        ])
    }
}
