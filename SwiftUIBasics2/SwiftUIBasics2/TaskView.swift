//
//  TaskView.swift
//  SwiftUIBasics2
//
//  Created by David on 12/8/23.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var taskColor: Color
    var taskName: String
    var taskDate: String
    var isComplete: Bool
}

struct TaskView: View {
    
    @State var task: Task
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(maxWidth: 20, maxHeight: .infinity)
                .foregroundStyle(task.taskColor)
            
            VStack {
                Text(task.taskName)
                    .font(.system(.headline).weight(.regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.white)
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundStyle(.white)
                        .fontWeight(.light)
                    Text(task.taskDate)
                        .font(.system(.subheadline).weight(.light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                }
            }
            
            Spacer()
            
            Button {
                task.isComplete.toggle()
            } label: {
                Image (systemName: task.isComplete ?
                       "checkmark.circle.fill" : "circle")
                .resizable()
                .foregroundStyle(Color(red: 0.64, green: 0.45, blue: 0.8))
            }
            .frame(width: 30, height: 30)
            .padding(.trailing)
        }
        .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        .frame(maxWidth: .infinity, minHeight: 80)
        .cornerRadius(10)
        .padding(.horizontal, 10)
    }
}

#Preview {
    TaskView(task: Task(taskColor: .green, taskName: "Mobile App Research", taskDate: "4 Oct", isComplete: true))
}
