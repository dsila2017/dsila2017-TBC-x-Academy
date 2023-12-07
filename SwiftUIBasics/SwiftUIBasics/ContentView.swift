//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by David on 12/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var nameText: String = ""
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var dateText: String = ""
    @State var countryText: String = ""
    
    var textFields: some View {
        
        VStack(spacing: 20) {
            HStack {
                Text("Name")
                    .padding(.leading, 20)
                    .font(.title3.bold())
                
                Spacer()
            }
            
            TextField("Test", text: $nameText)
                .padding(.leading, 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                )
            HStack {
                Text("Email")
                    .padding(.leading, 20)
                    .font(.title3.bold())
                Spacer()
            }
            
            TextField("Email", text: $emailText)
                .padding(.leading, 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                )
            
            HStack {
                Text("Password")
                    .padding(.leading, 20)
                    .font(.title3.bold())
                Spacer()
            }
            
            TextField("********", text: $passwordText)
                .padding(.leading, 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                )
            
            HStack {
                Text("Date of Birth")
                    .padding(.leading, 20)
                    .font(.title3.bold())
                Spacer()
            }
            
            TextField("31/02/2000", text: $dateText)
                .padding(.leading, 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                    
                )
            HStack {
                Text("Country/Region")
                    .padding(.leading, 20)
                    .font(.title3.bold())
                Spacer()
            }
            
            TextField("Georgia", text: $countryText)
                .padding(.leading, 30)
                .foregroundColor(Color.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                )
        }
    }
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 14) {
                Spacer()
                
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.title.bold())
                        .foregroundColor(.black)
                        .padding(.leading, 40)
                        .onTapGesture {
                            print("Go Back")
                        }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Spacer()
                }
                
                Image("swift")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 170)
                
                textFields
                
                Spacer()
                
                Button("Save Changes") {
                    print("Saved")
                }
                
                .font(.title.bold())
                .background(.black)
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .cornerRadius(10)
                
                Spacer()
            }
            .background(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
