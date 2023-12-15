//
//  Alert.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI

struct myAlert: View {
    
    @State var isAlertShowed = false
    
    //MARK: - Properties
    var tips: [String]
    
    //MARK: - Views
    var body: some View {
        
        Button("Get Travel Tip") {
            
            isAlertShowed = true
            
        }.alert("Travel Tip", isPresented: $isAlertShowed) {
            
        } message: {
            
            Text(tips.randomElement() ?? "Error")
            
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
        .tint(.teal)
    }
}
