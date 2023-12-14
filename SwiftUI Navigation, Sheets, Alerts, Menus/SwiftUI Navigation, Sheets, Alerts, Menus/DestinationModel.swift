//
//  DestinationModel.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI

// MARK: - DestinationModel
struct DestinationModel: Codable, Hashable {
    let destinations: [Destination]
}

// MARK: - Destination
struct Destination: Codable, Identifiable, Hashable {
    var id = UUID()
    let cityName, mainImage, description, generalImages: String
    let transport, mustSee, hotels: Details
}

// MARK: - Details
struct Details: Codable, Hashable {
    let image, name, description: String
    let price: String
}
