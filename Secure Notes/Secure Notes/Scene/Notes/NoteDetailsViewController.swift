//
//  NoteDetailsViewController.swift
//  Secure Notes
//
//  Created by David on 11/5/23.
//

import UIKit

final class NoteDetailsViewController: UIViewController {
    
    //MARK: - Private Views
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [noteNamelabel, noteView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let noteNamelabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let noteView = UIView()
    
    private let textField: UITextView = {
        let textField = UITextView()
        textField.backgroundColor = .cyan
        textField.text = " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "
        textField.isEditable = false
        return textField
    }()
    
    private var editSave: Bool = false
    var note: Note? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewSetup()
        navBarSetup()
    }
    
    //MARK: - Private Methods
    private func navBarSetup() {
        let button: UIButton = {
            let button = UIButton()
            button.setTitle("    Edit    ", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addAction(UIAction(handler: { [weak self] _ in
                if self?.editSave == false {
                    button.setTitle("Done", for: .normal)
                    self?.textField.isEditable = true
                    self?.editSave = true
                } else {
                    self?.textField.isEditable = false
                    self?.editSave = false
                    button.setTitle("Edit", for: .normal)
                    if let note = self?.note {
                        note.note = self?.textField.text ?? ""
                    }
                }
            }), for: .touchUpInside)
            return button
        }()
        navigationItem.setRightBarButton(UIBarButtonItem(customView: button), animated: true)
    }
    
    func configure(note: Note) {
        noteNamelabel.text = note.name
        textField.text = note.note
    }
    
    private func mainViewSetup() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        noteView.addSubview(textField)
        setupConstraints()
    }
    
    private func setupConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            noteNamelabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            textField.centerXAnchor.constraint(equalTo: noteView.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: noteView.centerYAnchor),
            textField.widthAnchor.constraint(equalTo: noteView.widthAnchor, multiplier: 0.7),
            textField.heightAnchor.constraint(equalTo: noteView.heightAnchor, multiplier: 0.7),
        ])
    }
    
}
