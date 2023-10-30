//
//  CustomCell.swift
//  UITableView
//
//  Created by David on 10/30/23.
//

import UIKit

class CustomCell: UITableViewCell {
    
    //MARK: Views
    let name: UILabel = {
        let name = UILabel()
        return name
    }()
    
    var cellImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    private func setup() {
        
        addSubview(name)
        addSubview(cellImageView)
        name.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            name.centerYAnchor.constraint(equalTo: centerYAnchor),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            cellImageView.heightAnchor.constraint(equalToConstant: 40),
            cellImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
