//
//  Model.swift
//  UICollectionView
//
//  Created by David on 11/3/23.
//

import UIKit

enum Genre {
    case Action, Adventure, Horror, Comedy
}
class Movie {
    var name: String
    var image: UIImage?
    var favourite: Bool?
    var genre: Genre
    var rating: Double
    
    init(name: String, image: UIImage? = nil, favourite: Bool? = nil, genre: Genre, rating: Double) {
        self.name = name
        self.image = image
        self.favourite = favourite
        self.genre = genre
        self.rating = rating
    }
    static let movies = [
        Movie(name: "Batman", image: UIImage(named: "Batman"), favourite: false, genre: .Action, rating: 8.1),
        Movie(name: "Uncharted", image: UIImage(named: "Uncharted"), favourite: false, genre: .Adventure, rating: 7.9),
        Movie(name: "The Exorcism of God", image: UIImage(named: "The Exorcism of God"), favourite: false, genre: .Horror, rating: 5.6),
        Movie(name: "Turning Red", image: UIImage(named: "Turning Red"), favourite: false, genre: .Comedy, rating: 7.1),
        Movie(name: "Spider-Man: No Way Home", image: UIImage(named: "Spider-Man No Way Home"), favourite: false, genre: .Action, rating: 8.1),
        Movie(name: "Morbius", image: UIImage(named: "Morbius"), favourite: false, genre: .Action, rating: 5.3)
    ]
}
