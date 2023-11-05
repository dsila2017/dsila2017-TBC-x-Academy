//
//  NoteListViewController.swift
//  Secure Notes
//
//  Created by David on 11/5/23.
//

import UIKit

class NoteListViewController: UIViewController {
    
    //MARK: - Private Views
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mainViewSetup()
    }
    
    //MARK: - Private Methods
    private func mainViewSetup() {
        view.addSubview(mainTableView)
        view.backgroundColor = .white
        setupTableView()
        setupConstraints()
        navBarSetup()
    }
    
    private func setupTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupConstraints() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
    
    private func navBarSetup() {
        let button: UIButton = {
            let button = UIButton()
            button.setImage(.add, for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addAction(UIAction(handler: { [weak self] _ in
                let vc = AddNoteViewController()
                vc.delegate = self
                self?.navigationController?.present(vc, animated: true)
            }), for: .touchUpInside)
            return button
        }()
        navigationItem.setRightBarButton(UIBarButtonItem(customView: button), animated: true)
    }
}

extension NoteListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "My Notes"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Note.Notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell {
            cell.textLabel?.text = Note.Notes[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = Note.Notes[indexPath.row]
        let vc = NoteDetailsViewController()
        vc.configure(note: model)
        vc.note = model
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            Note.Notes.remove(at: indexPath.row)
            tableView.endUpdates()
        }
    }
    
    
}

extension NoteListViewController: refreshDelegate {
    func reload() {
        self.mainTableView.reloadData()
    }
    
    
}
