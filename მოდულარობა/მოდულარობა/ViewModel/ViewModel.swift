//
//  ViewModel.swift
//  მოდულარობა
//
//  Created by David on 11/19/23.
//

import Foundation
import NetworkManager

protocol mainViewModelDelegate: AnyObject {
    func fetchData(CatArray: CatsModel)
}

class ViewModel {
    
    //MARK: Private Properties
    private var cats = CatsModel(data: [CatFacts(fact: "Hello")])
    weak var delegate: ViewController?
    
    //MARK: Private Methods
    func didLoad() {
        fetch()
    }
    
    func fetch() {
        NetworkManager.shared.fetchData(url: "https://catfact.ninja/facts?limit=100") { [weak self] (result : Result<CatsModel,Error>) in
            switch result {
            case .success(let catsData):
                self!.cats = catsData
                self?.delegate?.fetchData(CatArray: catsData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
