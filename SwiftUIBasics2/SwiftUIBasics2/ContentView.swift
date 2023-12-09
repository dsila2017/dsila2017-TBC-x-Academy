//
//  ContentView.swift
//  SwiftUIBasics2
//
//  Created by David on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var data = [
        Task(taskColor: Color(red: 0.98, green: 0.8, blue: 0.7), taskName: "Mobile App Research", taskDate: "Oct4", isComplete: true),
        Task(taskColor: Color(red: 0.84, green: 0.94, blue: 1), taskName: "Prepare Wireframe for Main Flow", taskDate: "Oct4", isComplete: true),
        Task(taskColor: Color(red: 0.98, green: 0.85, blue: 1), taskName: "Prepare Screens", taskDate: "Oct4", isComplete: true),
        Task(taskColor: Color(red: 0.98, green: 0.8, blue: 0.7), taskName: "Website Research", taskDate: "Oct4", isComplete: false),
        Task(taskColor: Color(red: 0.84, green: 0.94, blue: 1), taskName: "Prepare Wireframe for Main Flow", taskDate: "Oct4", isComplete: false),
        Task(taskColor: Color(red: 0.98, green: 0.85, blue: 1), taskName: "Prepare Screens", taskDate: "Oct4", isComplete: false)
    ]
    
    var completedData: [Task] {
        data.filter({$0.isComplete == true})
    }
    
    var nonCompletedData: [Task] {
        data.filter({$0.isComplete == false})
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("You have \(nonCompletedData.count) tasks to complete")
                    .frame(maxWidth: 200, alignment: .leading)
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(maxWidth: 70, maxHeight: 70)
                    .foregroundColor(.white)
                    .background(.gray)
                    .clipShape(Circle())
                    .overlay (
                        
                        Circle()
                            .fill(Color(Color(red: 0.64, green: 0.45, blue: 0.8)))
                            .frame(width: 20)
                            .overlay (
                                Text("\(nonCompletedData.count)")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            )
                        , alignment: .bottomTrailing)
            }
            .padding()
            
            VStack {
                Button {
                    //data.forEach({$0.isComplete = true})
                } label: {
                    Text("Complete All")
                        .font(.subheadline.bold())
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background((Color(red: 0.64, green: 0.45, blue: 0.8)))
                .cornerRadius(10)
                .foregroundStyle(.white)
                
                Text("Progress")
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                    .font(.title3.bold())
                    .foregroundStyle(.white)
            }
            .padding(10)
            
            VStack {
                Text("Daily Task")
                    .foregroundStyle(.white)
                    .font(.headline.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                
                Text("\(completedData.count)/\(data.count) Task Completed")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                
                ProgressView(value: Double(nonCompletedData.count)/Double(data.count))
                    .padding(10)
                    .tint((Color(red: 0.64, green: 0.45, blue: 0.8)))
                
                Spacer()
            }
            .frame(maxWidth: .infinity, minHeight: 140, maxHeight: 140)
            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
            .cornerRadius(10)
            .padding(10)
            
            VStack {
                ScrollView {
                    Section("Completed") {
                        ForEach(completedData) { task in
                            TaskView(task: task)
                        }
                    }
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Section("In Progress") {
                        ForEach(nonCompletedData) { task in
                            TaskView(task: task)
                        }
                    }
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    
                    Text("\(completedData.count)")
                        .foregroundStyle(.black)
                }
            }
        }
        .background(.black)
    }
}

#Preview {
    ContentView()
}
