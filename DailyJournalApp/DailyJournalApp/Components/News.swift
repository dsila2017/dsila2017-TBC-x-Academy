//
//  News.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct News: View {
    
    // MARK: - Properties
    var title: String
    var news: String
    var date: Date
    var category: String
    
    @StateObject var model: NewsViewModel
    @Binding var isFavourite: Bool
    @State var isOn = false
    
    // MARK: - Body
    var body: some View {
        HStack {
            VStack {
                Text(title)
                Text(news)
                Text(formatDate())
                Text(category)
            }
            
            .font(.custom("AmericanTypewriter", fixedSize: 24).bold())
            .foregroundStyle(Color(uiColor: .purple))
            .frame(maxWidth: .infinity)
            
            Image(systemName: isFavourite ? "star.fill" : "star")
                .foregroundStyle(Color(uiColor: .purple))
                .onTapGesture {
                    isFavourite.toggle()
                }
        }
    }
    
    private func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}
