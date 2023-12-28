//
//  Model.swift
//  Accessibility_UIKIToSwiftUI
//
//  Created by David on 12/28/23.
//

import SwiftUI

struct Model: Decodable {
    
    var articles: [Article]
    
    enum CodingKeys: String, CodingKey {
            case articles
        }
}

struct Article: Decodable {
    
    let author: String?
    let title: String
    let content: String?
    
}
