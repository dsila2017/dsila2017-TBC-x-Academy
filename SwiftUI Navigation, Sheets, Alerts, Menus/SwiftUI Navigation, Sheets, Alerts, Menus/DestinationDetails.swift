//
//  DestinationDetails.swift
//  SwiftUI Navigation, Sheets, Alerts, Menus
//
//  Created by David on 12/15/23.
//

import SwiftUI

struct DestinationDetails: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: DestinationViewModel
    @Binding var path: NavigationPath
    let destination: Details
    
    //MARK: - Views
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(systemName: destination.symbol)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 300)
            
            Spacer()
            
            Text("\(destination.description)")
                .bold()
            
            Spacer()
            
            Text("\(destination.price)")
            
            Spacer()
            
            Button(action: {
                path = NavigationPath()
            }, label: {
                Text("Back To Main")
            })
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
            .tint(.teal)
            .navigationTitle("\(destination.name)")
            
        }
        .padding()
    }
}
