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
            Text("\(index)")
            TextField("Title", text: $model.news[index].title)
            TextView(text: $model.news[index].news)
                .frame(maxHeight: 100)
            DatePicker("Date: ", selection: $model.news[index].date)
            Button(action: {
                model.isOn = false
            }, label: {
                Text("Save")
            })
        }
        .background(.red)
    }
}

//#Preview {
//    newsEditView(model: NewsViewModel())
//}
