//
//  DetailsPageViewModel.swift
//  UICollectionView
//
//  Created by David on 11/18/23.
//

import UIKit

class DetailPageViewModel {
    var movie = JsonMovie.movie
    
    func fetchMovie(url: String, completion: @escaping() -> ()) {
        NetworkService.fetchMovie(url: url) { result in
            self.movie = result
            print(self.movie)
            completion()
        }
    }
}
