//
//  JsonMovieModel.swift
//  UICollectionView
//
//  Created by David on 11/10/23.
//

import Foundation

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
