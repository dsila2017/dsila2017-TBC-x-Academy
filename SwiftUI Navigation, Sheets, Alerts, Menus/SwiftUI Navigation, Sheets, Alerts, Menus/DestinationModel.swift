//
//  DestinationModel.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI

// MARK: - DestionationModel
struct DestinationModel: Codable, Hashable {
    let destinations: [Destination]
}

// MARK: - Destination
struct Destination: Codable, Identifiable, Hashable {
    var id = UUID()
    let cityName, mainImage, description: String
    let generalImages: [GeneralImage]
    let transport, mustSee, hotels: [Hotel]
}

enum GeneralImage: String, Codable, Hashable {
    case image1 = "image1"
    case image2 = "image2"
    case image3 = "image3"
}

// MARK: - Hotel
struct Hotel: Codable, Hashable {
    let image, name, description: String
    let price: String?
}
