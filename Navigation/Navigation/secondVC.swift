//
//  secondVC.swift
//  Navigation
//
//  Created by David on 10/28/23.
//

import UIKit

class secondVC: UIViewController {

    //MARK: Views
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    let presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.addTarget(self, action: #selector(signInPresent), for: .touchUpInside)
        return button
    }()
    
    let pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.addTarget(self, action: #selector(signInPush), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(presentButton)
        stackView.addArrangedSubview(pushButton)
        setup()

    }
    
    func setup() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
        ])
    }
    
    @objc func signInPush() {
        let vc = paletteVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func signInPresent() {
        let vc = paletteVC()
        self.present(vc, animated: true)
    }
}
