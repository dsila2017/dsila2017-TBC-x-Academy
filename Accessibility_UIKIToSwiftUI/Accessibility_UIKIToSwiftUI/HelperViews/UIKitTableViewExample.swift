//
//  UITableView.swift
//  Accessibility_UIKIToSwiftUI
//
//  Created by David on 12/28/23.
//

import SwiftUI

struct UIKitTableView: UIViewRepresentable {
    
    @ObservedObject var model: ViewModel
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(model: model)
    }
    
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        
        @ObservedObject var model: ViewModel
        
        init(model: ViewModel) {
            self.model = model
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            model.data.articles.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell
            cell?.configureCell(model: model.data.articles[indexPath.row])
            return cell ?? UITableViewCell()
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Next")
        }
    }
}
