//
//  DetailsPageModel.swift
//  UICollectionView
//
//  Created by David on 11/18/23.
//

import Foundation

// MARK: - JsonMovie
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
