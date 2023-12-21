//
//  Components.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct TextView: View {
    
    @StateObject var model: NewsViewModel
    //@Binding var text: String

    var body: some View {
        NavigationStack {
            TextEditor(text: $model.newsText)
                .foregroundStyle(.placeholder)
        }
    }
}
