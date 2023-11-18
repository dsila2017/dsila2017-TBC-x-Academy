//
//  HomeModel.swift
//  UICollectionView
//
//  Created by David on 11/18/23.
//

import UIKit

class HomePageViewModel {
    
    var movies = Search.movies
    
    func numberOfItemsInSection() -> Int {
        movies.count
    }
    
    func fetchMovies(completion: @escaping() -> ()) {
        NetworkService.fetchMovies { result in
            self.movies = result
            print(self.movies.count)
            completion()
        }
    }
}
