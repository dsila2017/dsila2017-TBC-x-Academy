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
            NavigationLink {
                switch name {
                case "Transport" :
                    DestinationDetails(path: $path, destination: destination.transport)
                case "Must See":
                    DestinationDetails(path: $path, destination: destination.mustSee)
                case "Hotels":
                    DestinationDetails(path: $path, destination: destination.hotels)
                default:
                    Text("Error")
                }
            } label: {
                Text(name)
            }
//            NavigationLink(value: cityDetails) {
//                //Text("\(destination.transport.count)")
//                Text("x")
//            }
            
//        } .navigationDestination(for: String.self) { name in
//            DestinationDetails(destination: destination.cityName, path: $path)
        }
        
        
    }
}
