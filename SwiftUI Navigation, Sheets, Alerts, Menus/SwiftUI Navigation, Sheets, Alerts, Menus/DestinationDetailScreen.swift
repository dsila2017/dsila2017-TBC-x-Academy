//
//  DestinationDetailScreen.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/15/23.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    @EnvironmentObject var viewModel: DestinationViewModel
    var destination: Destination
    var buttonNames = ["Transport", "Must See", "Hotels"]
    @Binding var path: NavigationPath
    
    var body: some View {
        Text(destination.description)
        Image("\(destination.mainImage)")
            .resizable()
            .frame(width: 200, height: 140)
        
        ForEach(buttonNames, id: \.self) { name in
                switch name {
                case "Transport" :
                    NavigationLink(value: destination.transport) {
                        Text("\(name)")
                    }
                case "Must See":
                    NavigationLink(value: destination.mustSee) {
                        Text("\(name)")
                    }
                case "Hotels":
                    NavigationLink(value: destination.hotels) {
                        Text("\(name)")
                    }
                default:
                    Text("Error")
                }
            
        }.navigationDestination(for: Details.self) { details in
            DestinationDetails(path: $path, destination: details)
        }
        
        
    }
}
