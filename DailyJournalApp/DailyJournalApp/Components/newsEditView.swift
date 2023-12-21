//
//  newsEditView.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct newsEditView: View {
    var index: Int
    
    @ObservedObject var model: NewsViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Edit News")
                .font(.custom("AmericanTypewriter", fixedSize: 24).bold())
                .foregroundStyle(Color(uiColor: .purple))
            List {
                
                TextField("Title", text: $model.news[index].title)
                    
                TextView(text: $model.news[index].news)
                
                
                    .frame(height: 200)
                
                DatePicker("Date: ", selection: $model.news[index].date)
                Button(action: {
                    model.isOn = false
                }, label: {
                    Text("Save")
                        .frame(maxWidth: .infinity, alignment: .center)
                })
            }
            .font(.custom("AmericanTypewriter", fixedSize: 18).bold())
            .foregroundStyle(Color(uiColor: .purple))
            .foregroundStyle(Color(uiColor: .purple))
        }
        
    }
}

//#Preview {
//    newsEditView(model: NewsViewModel())
//}
