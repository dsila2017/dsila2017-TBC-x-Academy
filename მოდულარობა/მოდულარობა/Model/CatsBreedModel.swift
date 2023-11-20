//
//  CatsBreedModel.swift
//  მოდულარობა
//
//  Created by David on 11/20/23.
//

import Foundation

struct CatsBreedModel: Decodable {
    let data: [Breed]?
}

struct Breed: Decodable {
    let breed, country, origin, coat, pattern: String
}
