//
//  newsEditView.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct newsEditView: View {
    @State var text: String = "sd"
    var index: Int
    
    @StateObject var model: NewsViewModel
    
    var body: some View {
        VStack {
            TextField("Title", text: $model.news[index].title)
            TextView1(text: $model.news[index].news)
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

struct TextView1: View {
    
    @Binding var text: String

    var body: some View {
        NavigationStack {
            TextEditor(text: $text)
                .foregroundStyle(.placeholder)
        }
    }
}
