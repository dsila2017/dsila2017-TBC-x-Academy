//
//  DestionationViewModel.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI
import NetworkManager

class DestinationViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var destinationList: DestinationModel?
    @Published var destinations = [
        Destination(cityName: "Tbilisi", mainImage: "Georgia", description: "Tbilisi is capital of Georgia", flag: "🇬🇪", transport: Details(symbol: "transport1", name: "Tbilisi Transport", description: "Efficient", price: "10$"), mustSee: Details(symbol: "Must See", name: "Tbilisi Must See", description: "Must See", price: "10$"), hotels: Details(symbol: "Hotel", name: "Tbilisi Hotel", description: "Hotel", price: "Hotel$")),
        
        Destination(cityName: "Berlin", mainImage: "Germany", description: "Berlin is capital of Germany", flag: "🇩🇪", transport: Details(symbol: "transport1", name: "Berlin Transport", description: "Transport Desc", price: "10$"), mustSee: Details(symbol: "Must See Image", name: "Berlin Must See", description: "Must See Desc", price: "Must See1$"), hotels: Details(symbol: "Hotel Image", name: "Berlin Hotel", description: "Hotel Description", price: "10$"))
        
    ]
    
    @Published var travelTips = [
        "Pack a travel adapter to ensure your electronic devices can be charged in different countries.",
        "Use a money belt or hidden pouch to keep your valuables secure while exploring.",
        "Research local customs and traditions to show respect for the culture you're visiting.",
        "Keep a digital and physical copy of important travel documents, such as passports and reservations.",
        "Learn a few basic phrases in the local language to enhance your travel experience.",
        "Pack a reusable water bottle to stay hydrated and reduce single-use plastic consumption.",
        "Check the weather forecast for your destination and pack accordingly.",
        "Inform your bank about your travel plans to avoid any issues with your credit/debit cards.",
        "Stay flexible in your itinerary to allow for unexpected discoveries and experiences.",
        "Purchase travel insurance to cover unexpected events and emergencies during your trip."
    ]
    
    //MARK: - Init
    init() {
        fetchData {
            print("Hello")
        }
    }
    
    //MARK: - Methods
    private func fetchData(completion: @escaping() -> ()) {
        NetworkManager.shared.fetchData(url: "https://mocki.io/v1/5816d58a-8aaa-47b3-bfe7-bda6a30712bc") { [weak self] (result: Result<DestinationModel, Error>) in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.destinations = result.destinations
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
