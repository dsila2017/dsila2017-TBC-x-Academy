// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo:[NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo:[NSLocalizedDescriptionKey: "No Data"])))
                return
            }
            
            do {
                let newResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(newResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
