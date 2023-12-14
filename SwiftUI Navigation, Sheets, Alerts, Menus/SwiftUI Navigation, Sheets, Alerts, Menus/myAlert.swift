//
//  Alert.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI

struct myAlert: View {
    
    @State var isAlertShowed = false
    
    var tips: [String]
    
    var body: some View {
        
        Button("Alert Button") {
            
            isAlertShowed = true
        }.alert(isPresented: $isAlertShowed) {
            
            Alert(
                title: Text(tips.randomElement() ?? "Error"),
                primaryButton: .destructive(
                    Text("ok"),
                    action: {
                        
                    }
                ),
                secondaryButton: .cancel()
            )
        }
    }
}

//#Preview {
//    myAlert(tips: viewModel.travelTips)
//}
