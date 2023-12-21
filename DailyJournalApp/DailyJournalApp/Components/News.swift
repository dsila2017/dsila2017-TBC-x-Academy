//
//  News.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct News: View {
    
    var title: String
    var news: String
    var date: Date
    @State var isOn = false
    @StateObject var model: NewsViewModel
    
    
    var body: some View {
        VStack {
            Text(title)
            Text(news)
            Text(formatDate())
        }
        .font(.custom("AmericanTypewriter", fixedSize: 24).bold())
        .foregroundStyle(Color(uiColor: .purple))
        .frame(maxWidth: .infinity)
    }
    
    private func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}
