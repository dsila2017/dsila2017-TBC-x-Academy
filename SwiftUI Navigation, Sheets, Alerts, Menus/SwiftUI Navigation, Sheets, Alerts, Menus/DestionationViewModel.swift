//
//  DestionationViewModel.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI
import NetworkManager

class DestionationViewModel: ObservableObject {
    
    @Published var destionationList: DestinationModel?
    @Published var destionations = [
        Destination(cityName: "Tbilisi", mainImage: "Georgia", description: "Tbilisi is capital of Georgia", generalImages: [GeneralImage.image1], transport: [Hotel(image: "transport1", name: "Tbilisi Transport", description: "Efficient", price: "10$")], mustSee: [Hotel(image: "Must See", name: "Tbilisi Must See", description: "Must See", price: "10$")], hotels: [Hotel(image: "Hotel", name: "Tbilisi Hotel", description: "Hotel", price: "Hotel$")]),
        
        Destination(cityName: "Berlin", mainImage: "Germany", description: "Berlin is capital of Germany", generalImages: [GeneralImage.image1], transport: [Hotel(image: "transport1", name: "Berlin Transport", description: "Transport Desc", price: "10$")], mustSee: [Hotel(image: "Must See Image", name: "Berlin Must See", description: "Must See Desc", price: "Must See1$")], hotels: [Hotel(image: "Hotel Image", name: "Berlin Hotel", description: "Hotel Description", price: "10$")])
        
        ]
    
    @Published var travelTips = [
        "Tip N1",
        "Tip N2",
        "Tip N3",
        "Tip N4"
    ]
    
    init() {
        fetchData {
            print("Hello")
        }
    }
    func fetchData(completion: @escaping() -> ()) {
        NetworkManager.shared.fetchData(url: "https://mocki.io/v1/fffc1897-2f53-46ad-917b-c1926e2470e1") { [weak self] (result: Result<DestinationModel, Error>) in
            switch result {
            case .success(let result):
                self?.destionationList = result
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
