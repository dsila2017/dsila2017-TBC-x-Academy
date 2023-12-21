//
//  newsEditView.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct newsEditView: View {
    
    // MARK: - Properties
    @ObservedObject var model: NewsViewModel
    var index: Int
    
    // MARK: - Body
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
                
                Picker("Category: ", selection: $model.selectedCategory) {
                    ForEach(model.categories, id: \.self) { category in
                        Text(category)
                    }
                }
                
                Button(action: {
                    model.isOn = false
                    model.editSaveButton(index: index)
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
