//
//  JsonMovieModel.swift
//  UICollectionView
//
//  Created by David on 11/10/23.
//

import Foundation

struct JsonMovie: Codable {
    
    var Title: String?
    var Year: String?
    var Rated: String?
    var Runtime: String?
    var Genre: String?
    var Director: String?
    var Actors: String?
    var Poster: String?
    var imdbRating: String?
    var Plot: String?
    
    static var movie = JsonMovie()
}




struct MovieArray: Codable {
    let Search: [Search]
    
}

// MARK: - Search
struct Search: Codable {
    let title, year, imdbID: String
    let poster: String
    var favourite: Bool?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
    
    static var movies = [Search]()
}

