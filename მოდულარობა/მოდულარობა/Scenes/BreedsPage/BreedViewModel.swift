//
//  BreedViewModel.swift
//  მოდულარობა
//
//  Created by David on 11/20/23.
//

import Foundation
import NetworkManager

protocol BreedViewModelDelegate: AnyObject {
    func notifyFetchedData(breeds: CatsBreedModel)
    func notifyFetchedError(error: Error)
}

final class BreedViewModel {
    weak var delegate: BreedViewModelDelegate?
    
    func viewDidLoad() {
        fetchBreedsData()
    }
    
    private func fetchBreedsData() {
        NetworkManager.shared.fetchData(url: "https://catfact.ninja/breeds?limit=100") { [weak self] (result: Result<CatsBreedModel, Error>) in
            switch result {
            case .success(let breeds):
                self?.delegate?.notifyFetchedData(breeds: breeds)
            case .failure(let error):
                self?.delegate?.notifyFetchedError(error: error)
            }
        }
    }
}
