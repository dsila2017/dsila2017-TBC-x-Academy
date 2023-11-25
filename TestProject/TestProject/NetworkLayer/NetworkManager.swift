//
//  NetworkManager.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation
import UIKit

final class NetworkManager {
    
    //static აკლდა
    static let shared = NetworkManager()
    
    public init() {}
    
    func get<T: Decodable>(url: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            
            guard let data else {
                return
            }
            print("data")
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            } catch let error {
                completion(.failure(error))
            }
            //TODO: resume აკლდა
        }.resume()
    }
    
    //TODO: KingFisherით ბევრი ადგილი მიქონდა, პრობლემა მეგონა დავსერჩე და თურმე ქეშირებას აკეთებს და ძაან დიდი სთორიჯი მიაქ ფოტოებს.
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}
