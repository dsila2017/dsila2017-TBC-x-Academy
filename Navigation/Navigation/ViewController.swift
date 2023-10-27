//
//  ViewController.swift
//  Navigation
//
//  Created by David on 10/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Views
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Top")
        return imageView
    }()
    
    let faceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Face")
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        stackView.spacing = 14
        return stackView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textField.font = UIFont.systemFont(ofSize: 14, weight: .light)
        textField.layer.borderWidth = 0.4
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textAlignment = .left
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 14
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x:0, y:0, width:10, height:0))
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textField.font = UIFont.systemFont(ofSize: 14, weight: .light)
        textField.layer.borderWidth = 0.4
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textAlignment = .left
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 14
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x:0, y:0, width:10, height:0))
        return textField
    }()
    
    let forgotButton: UIButton = {
        var button = UIButton()
        button.setTitle("Forgot Your Password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.contentHorizontalAlignment = .right
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    
    let signInButton: UIButton = {
        var button = UIButton()
        button.configuration = .filled()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.configuration?.cornerStyle = .capsule
        button.tintColor = .systemIndigo
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let orImageView: UIImageView = {
        let orImageView = UIImageView()
        orImageView.image = UIImage(named: "Or")
        
        return orImageView
    }()
    
    let socialImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Social")
        
        return imageView
    }()
    
    let bottom: UIView = {
        let view = UIView()
        return view
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account. Sign Up"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    func setup() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        middleView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        faceImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        orImageView.translatesAutoresizingMaskIntoConstraints = false
        socialImageView.translatesAutoresizingMaskIntoConstraints = false
        bottom.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30),
            
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleView.widthAnchor.constraint(equalTo: view.widthAnchor),
            middleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40),
            
            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.widthAnchor.constraint(equalTo: view.widthAnchor),
            bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30),
            
            topImageView.topAnchor.constraint(equalTo: topView.topAnchor),
            topImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            topImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            topImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            
            faceImageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor),
            faceImageView.bottomAnchor.constraint(equalTo: topImageView.bottomAnchor),
            faceImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            faceImageView.heightAnchor.constraint(equalTo: faceImageView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: middleView.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            orImageView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            orImageView.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            orImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            socialImageView.topAnchor.constraint(equalTo: orImageView.bottomAnchor),
            socialImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottom.topAnchor.constraint(equalTo: socialImageView.bottomAnchor),
            bottom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottom.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottom.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            signUpLabel.centerXAnchor.constraint(equalTo: bottom.centerXAnchor),
            signUpLabel.centerYAnchor.constraint(equalTo: bottom.centerYAnchor)
        ])
    }
    
    func stackViewSetup() {
        stackView.addArrangedSubview(signInLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(forgotButton)
        stackView.addArrangedSubview(signInButton)
    }
    
    func addViews() {
        stackViewSetup()
        view.addSubview(topView)
        topView.addSubview(topImageView)
        topImageView.addSubview(faceImageView)
        view.addSubview(middleView)
        middleView.addSubview(stackView)
        view.addSubview(bottomView)
        bottomView.addSubview(orImageView)
        bottomView.addSubview(socialImageView)
        bottomView.addSubview(bottom)
        bottom.addSubview(signUpLabel)
        setup()
    }
    
    
    
    @objc func signIn() {
        let vc = secondVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

