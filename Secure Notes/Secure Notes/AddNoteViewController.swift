//
//  AddNoteViewController.swift
//  Secure Notes
//
//  Created by David on 11/5/23.
//

import UIKit

protocol refreshDelegate {
    func reload()
}

class AddNoteViewController: UIViewController {

    //MARK: - Private Views
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topView, bottomView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        return stackView
    }()
    
    private let noteLabel: UITextField = {
        let username = UITextField()
        username.attributedPlaceholder = NSAttributedString(string: "Note name: ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        username.font = UIFont.systemFont(ofSize: 14, weight: .light)
        username.layer.borderWidth = 0.4
        username.layer.borderColor = UIColor.gray.cgColor
        username.textAlignment = .left
        username.backgroundColor = .clear
        username.layer.cornerRadius = 14
        username.leftViewMode = .always
        username.leftView = UIView(frame: CGRect(x:0, y:0, width:10, height:0))
        return username
    }()
    
    private let noteDescription: UITextField = {
        let username = UITextField()
        username.attributedPlaceholder = NSAttributedString(string: "Note description ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        username.font = UIFont.systemFont(ofSize: 14, weight: .light)
        username.layer.borderWidth = 0.4
        username.layer.borderColor = UIColor.gray.cgColor
        username.textAlignment = .left
        username.backgroundColor = .clear
        username.layer.cornerRadius = 14
        username.leftViewMode = .always
        username.leftView = UIView(frame: CGRect(x:0, y:0, width:10, height:0))
        return username
    }()
    
    private let noteNamelabel: UILabel = {
        let label = UILabel()
        label.text = "Add New Note"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor(rgb: 0xF1BB1D)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 10
        button.addAction(UIAction(handler: { [weak self] _ in
            if (self?.noteLabel.text?.count)! > 0 && (self?.noteDescription.text?.count)! > 0 {
                print(self?.noteLabel)
                let note = Note(name: (self?.noteLabel.text)!, note: (self?.noteDescription.text)!)
                Note.Notes.append(note)
                self?.delegate?.reload()
                self?.dismiss(animated: true)
            }
            else{
                self?.alert()
            }
            
            //self?.alert()
        }), for: .touchUpInside)
        return button
    }()
    
    let topView = UIView()
    let bottomView = UIView()
    
    var delegate: refreshDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupMainView()
        
    }
    
    private func setupMainView() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        topView.addSubview(noteNamelabel)
        topView.addSubview(noteLabel)
        bottomView.addSubview(noteDescription)
        bottomView.addSubview(saveButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        noteNamelabel.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        noteDescription.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            noteNamelabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            noteNamelabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            noteNamelabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.7),
            noteNamelabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.1),
            
            noteLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            noteLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            noteLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.7),
            noteLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.1),
            
            noteDescription.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            noteDescription.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            noteDescription.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.7),
            noteDescription.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.4),
            
            saveButton.topAnchor.constraint(equalTo: noteDescription.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.7),
            saveButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.1),
            
        ])
    }
}

extension AddNoteViewController {
    func alert() {
        let alert = UIAlertController(title: "Error", message: "Please note name and description", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}
