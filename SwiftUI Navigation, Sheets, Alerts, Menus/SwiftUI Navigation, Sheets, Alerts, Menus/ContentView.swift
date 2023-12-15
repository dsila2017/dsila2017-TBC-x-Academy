//
//  ContentView.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @StateObject private var viewModel = DestinationViewModel()
    @State var path = NavigationPath()
    
    //MARK: - Views
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                VStack {
                    List(viewModel.destinations, id: \.self) { destination in
                        NavigationLink(value: destination) {
                            HStack {
                                Text(destination.cityName)
                                Text(destination.flag)
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
