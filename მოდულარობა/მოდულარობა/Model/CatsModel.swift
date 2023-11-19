//
//  Model.swift
//  მოდულარობა
//
//  Created by David on 11/19/23.
//

import Foundation

struct CatsModel: Decodable {
    let data: [CatFacts]?
}

struct CatFacts: Decodable {
    let fact: String
}
