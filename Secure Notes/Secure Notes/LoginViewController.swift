//
//  ViewController.swift
//  Secure Notes
//
//  Created by David on 11/5/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Private Views
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topStackView, bottomStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginImage])
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [myView])
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var userStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [username, password, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let loginImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "illustration")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let username: UITextField = {
        let username = UITextField()
        username.attributedPlaceholder = NSAttributedString(string: "Username: ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
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
    
    private let password: UITextField = {
        let username = UITextField()
        username.attributedPlaceholder = NSAttributedString(string: "Password: ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(rgb: 0xF1BB1D)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 10
        button.addAction(UIAction(handler: { [weak self] _ in
            let vc = NoteListViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
            
            //self?.alert()
        }), for: .touchUpInside)
        return button
    }()
    
    let myView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMainView()
    }
    
    //MARK: - Private Methods
    private func setupMainView() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        myView.addSubview(userStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        userStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            topStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            userStackView.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            userStackView.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            userStackView.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.7),
            userStackView.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 0.4),
            
        ])
    }
}

extension LoginViewController {
    
    func alert() {
        let alert = UIAlertController(title: "Error", message: "Please enter song name and choose a photo", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}
