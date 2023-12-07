//
//  Chat.swift
//  SwiftUIBasics
//
//  Created by David on 12/7/23.
//

import SwiftUI
struct Person: Identifiable {
    var id = UUID()
    let name: String
    let message: String
    let time: String
    let image: Image
}

struct Chat: View {
    
    @State var persons = [
        Person(name: "Francisco Miles", message: "I went there yesterday", time: "18:14", image: Image("profile")),
        Person(name: "Arlene Fisher", message: "IDK whats there", time: "22:31", image: Image("profile")),
        Person(name: "Darlene Hawkins", message: "No, I can't come tomorrow.", time: "09:18", image: Image("profile")),
        Person(name: "Eduardo Mckinney", message: "Go to hell", time: "Yesterday", image: Image("profile")),
        Person(name: "Aubrey Cooper", message: "What's the progress on that task?", time: "8/19/20", image: Image("profile")),
        Person(name: "Kristin Pena", message: "Yeah! You're right.", time: "7/22/20", image: Image("profile")),
        Person(name: "Coody Cooper", message: "What's the progress on that task?", time: "Tuesday", image: Image("profile")),
        Person(name: "Stella Henry", message: "No Message", time: "Friday", image: Image("profile")),
        Person(name: "Jorge Nguyen", message: "Random Message", time: "Monday", image: Image("profile")),
        Person(name: "Brandie Watson", message: "Random Message", time: "Saturday", image: Image("profile")),
        
    ]
    
    @State var saved = [Person]()
    @State var cleared = [Person]()
    @State private var alert = false
    
    var body: some View {
        
        VStack {
            NavigationView {
                
                List {
                    ForEach(persons) { person in
                        
                        HStack {
                            person.image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            
                            VStack {
                                Text(person.name)
                                    .font(.title3.bold())
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(person.message)
                                    .font(.body)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Spacer()
                            
                            Text(person.time)
                        }
                    }
                }
                .navigationTitle("Chat")
                .navigationBarTitleDisplayMode(.inline)
            }
            
            HStack {
                
                Button("Reset Chat", action: {
                    cleared = persons
                    persons = saved
                })
                
                Spacer()
                
                Button("Clear Chat", action: {
                    saved = persons
                    persons = cleared
                    alert = true
                })
                .alert("Chat has been deleted", isPresented: $alert) {
                    Button("OK", role: .cancel) {}
                }
            }
            .padding(.horizontal, 40)
        }
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
