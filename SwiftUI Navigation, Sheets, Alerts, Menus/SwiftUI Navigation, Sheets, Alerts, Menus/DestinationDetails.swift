//
//  DestinationDetails.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/15/23.
//

import SwiftUI

struct DestinationDetails: View {
    
    @EnvironmentObject var viewModel: DestinationViewModel
    @Binding var path: NavigationPath
    var destination: Details
    
    var body: some View {
       
            
            ScrollView {
                
                Text("\(destination.name)")
                
                Button(action: {
                    path = NavigationPath()
                }, label: {
                    Text("\(path.count)")
                })
        }
    }
}
