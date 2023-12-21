//
//  Components.swift
//  DailyJournalApp
//
//  Created by David on 12/21/23.
//

import SwiftUI

struct TextView: View {
    
    // MARK: - Properties
    @Binding var text: String

    // MARK: - Body
    var body: some View {
        NavigationStack {
            TextEditor(text: $text)
        }
    }
}
