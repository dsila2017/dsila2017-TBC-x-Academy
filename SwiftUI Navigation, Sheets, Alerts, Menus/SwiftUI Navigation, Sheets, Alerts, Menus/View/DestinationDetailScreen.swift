//
//  DestinationDetailScreen.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/15/23.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: DestinationViewModel
    let destination: Destination
    private let buttonNames = ["Transport", "Must See", "Hotels"]
    @Binding var path: NavigationPath
    
    //MARK: - Views
    var body: some View {
        
        Spacer()
        
        Image("\(destination.mainImage)")
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: 200)
            .cornerRadius(20)
            .padding()
        
        Spacer()
        
        Text(destination.description)
            .padding()
            .bold()
        
        Spacer()
        
        ForEach(buttonNames, id: \.self) { name in
            switch name {
            case "Transport" :
                Button(action: {}, label: {
                    NavigationLink(value: destination.transport) {
                        Text("\(name)")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.teal)
                })
            case "Must See":
                Button(action: {}, label: {
                    NavigationLink(value: destination.mustSee) {
                        Text("\(name)")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.teal)
                })
            case "Hotels":
                Button(action: {}, label: {
                    NavigationLink(value: destination.hotels) {
                        Text("\(name)")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.teal)
                })
            default:
                Text("Error")
            }
        }.navigationDestination(for: Details.self) { details in
            DestinationDetails(path: $path, destination: details)
        }
    }
}
