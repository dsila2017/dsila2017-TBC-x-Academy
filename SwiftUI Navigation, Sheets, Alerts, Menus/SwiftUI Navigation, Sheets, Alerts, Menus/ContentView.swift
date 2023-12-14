//
//  ContentView.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DestinationViewModel()
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                VStack {
                    List(viewModel.destinations) { destination in
                        NavigationLink(value: destination) {
                            HStack {
                                Text(destination.cityName)
                                Text(destination.generalImages)
                            }
                        }
                        
                    }
                    myAlert(tips: viewModel.travelTips)
                    
                }.navigationDestination(for: Destination.self, destination: { destination in
                    DestinationDetailScreen(destination: destination, path: $path)
                })
                
            }.navigationTitle("Travel Cities")
        }.environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
