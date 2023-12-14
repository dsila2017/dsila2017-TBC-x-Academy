//
//  ContentView.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DestionationViewModel()
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                
                VStack {
                    
                    ForEach(viewModel.destionations) { destination in
                        NavigationLink(value: destination) {
                            Text(destination.cityName)
                        }
                    }
                }.navigationDestination(for: Destination.self, destination: { destination in
                    DestinationDetailScreen(destination: destination, path: $path)
                })
                .padding()
                
                myAlert(tips: viewModel.travelTips)
            }
        }.environmentObject(viewModel)
    }
}

struct DestinationDetailScreen: View {
    
    @EnvironmentObject var viewModel: DestionationViewModel
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
                    DestinationDetails(destination: destination.transport, path: $path)
                case "Must See":
                    DestinationDetails(destination: destination.mustSee, path: $path)
                case "Hotels":
                    DestinationDetails(destination: destination.hotels, path: $path)
                default:
                    Text("Error")
                }
            } label: {
                Text(name)
            }
        }
        
        
    }
}

struct DestinationDetails: View {
    
    @EnvironmentObject var viewModel: DestionationViewModel
    var destination: [Hotel]
    @Binding var path: NavigationPath
    
    var body: some View {
       
            
            ScrollView {
                
                Text("\(destination[0].name)")
                
                Button(action: {
                    //path.removeAll()
                }, label: {
                    Text("\(path.count)")
                })

                
//                ForEach(1..<100) { index in
//                    NavigationLink(value: index) {
//                        Text("button: \(index)")
//                    }
//                }.navigationDestination(for: Int.self) { number in
//                    Text("\(number)")
//                }
            
        }
    }
}

#Preview {
    ContentView()
}
