//
//  NewsModel.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct NewsModel: Identifiable {
    
    var id = UUID()
    var title: String
    var news: String
    var date: Date
    var isFavourite: Bool = false
    
}
