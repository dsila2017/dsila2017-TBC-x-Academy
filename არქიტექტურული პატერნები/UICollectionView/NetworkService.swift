//
//  File.swift
//  UICollectionView
//
//  Created by David on 11/10/23.
//

import Foundation

class NetworkService {
    
    static func fetchMovies(completion: @escaping([Search]) -> ()) {
        let urlString = "http://omdbapi.com/?s=fast&apikey=2fc7276c"
        let url = URL(string: urlString)
        let urlrequest = URLRequest(url: url!)
        URLSession.shared.dataTask(with: urlrequest) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("wrong response")
                return
            }
            
            guard let data else { return }
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(MovieArray.self, from: data)
                
                DispatchQueue.main.async {
                    Search.movies = object.Search
                    completion(object.Search)
                    print(Search.movies.count)
                }
            } catch {
                print("Error")
            }
            
            
            
            
        }.resume()
        
    }
    
    static func fetchMovie(url: String, completion: @escaping(JsonMovie) -> ()) {
        let urlString = "http://omdbapi.com/?"
        var urlComponents = URLComponents(string: urlString)
        
        urlComponents?.queryItems = [
            
            URLQueryItem(name: "i", value: url),
            URLQueryItem(name: "apikey", value: "2fc7276c")
            
        ]
        
        let url = urlComponents?.url
        let urlrequest = URLRequest(url: url!)
        URLSession.shared.dataTask(with: urlrequest) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("wrong response")
                return
            }
            
            guard let data else { return }
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(JsonMovie.self, from: data)
                
                DispatchQueue.main.async {
                    JsonMovie.movie = object
                    completion(object)
                    
                }
            } catch {
                print("Error")
            }
            
            
            
        }.resume()
        
    }
}
