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
//                .onTapGesture {
//                    model.isOn = true
//                }
//                .sheet(isPresented: $model.isOn) {
//                    newsEditView(model: model)
//                }
            Text(formatDate())
        }
        
        .font(.custom("AmericanTypewriter", fixedSize: 24))
        .foregroundStyle(Color(uiColor: .purple))
        .frame(maxWidth: .infinity)
        .background(.red)
    }
    
    private func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}

//#Preview {
//    News(title: "Title", news: "News", date: .now)
//}
