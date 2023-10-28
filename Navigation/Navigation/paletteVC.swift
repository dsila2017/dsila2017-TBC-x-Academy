//
//  paletteVC.swift
//  Navigation
//
//  Created by David on 10/28/23.
//

import UIKit

class paletteVC: UIViewController {
    
    //MARK: Views
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        return stackView
    }()
    
    let upperLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Home Buttons Background Colors"
        label.textAlignment = .center
        return label
    }()
    
    let lowerLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Home Background Color"
        label.textAlignment = .center
        return label
    }()
    
    let upperHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let upperVStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let upperVStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let lowerHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let lowerVStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let lowerVStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let color1: UIButton = {
        let button = UIButton()
        button.setTitle("Red", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .red
        button.tintColor = .red
        button.addTarget(self, action: #selector(changeColors(button: )), for: .touchUpInside)
        return button
    }()
    
    let color2: UIButton = {
        let button = UIButton()
        button.setTitle("Indigo", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .systemIndigo
        button.tintColor = .systemIndigo
        button.addTarget(self, action: #selector(changeColors(button: )), for: .touchUpInside)
        return button
    }()
    
    let color3: UIButton = {
        let button = UIButton()
        button.setTitle("Orange", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .orange
        button.tintColor = .orange
        button.addTarget(self, action: #selector(changeColors(button: )), for: .touchUpInside)
        return button
    }()
    
    let color4: UIButton = {
        let button = UIButton()
        button.setTitle("Violet", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .purple
        button.tintColor = .purple
        button.addTarget(self, action: #selector(changeColors(button: )), for: .touchUpInside)
        return button
    }()
    
    let color5: UIButton = {
        let button = UIButton()
        button.setTitle("Mint", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .systemMint
        button.tintColor = .systemMint
        button.addTarget(self, action: #selector(changeColors(button: )), for: .touchUpInside)
        return button
    }()
    
    let color6: UIButton = {
        let button = UIButton()
        button.setTitle("Brown", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .brown
        button.tintColor = .brown
        button.addTarget(self, action: #selector(changeColors(button: )), for: .touchUpInside)
        return button
    }()
    
    let background1: UIButton = {
        let button = UIButton()
        button.setTitle("Red", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .red
        button.tintColor = .red
        button.addTarget(self, action: #selector(changeBackground(button: )), for: .touchUpInside)
        return button
    }()
    
    let background2: UIButton = {
        let button = UIButton()
        button.setTitle("Indigo", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .systemIndigo
        button.tintColor = .systemIndigo
        button.addTarget(self, action: #selector(changeBackground(button: )), for: .touchUpInside)
        return button
    }()
    
    let background3: UIButton = {
        let button = UIButton()
        button.setTitle("Orange", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .orange
        button.tintColor = .orange
        button.addTarget(self, action: #selector(changeBackground(button: )), for: .touchUpInside)
        return button
    }()
    
    let background4: UIButton = {
        let button = UIButton()
        button.setTitle("Violet", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .purple
        button.tintColor = .purple
        button.addTarget(self, action: #selector(changeBackground(button: )), for: .touchUpInside)
        return button
    }()
    
    let background5: UIButton = {
        let button = UIButton()
        button.setTitle("Mint", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .systemMint
        button.tintColor = .systemMint
        button.addTarget(self, action: #selector(changeBackground(button: )), for: .touchUpInside)
        return button
    }()
    
    let background6: UIButton = {
        let button = UIButton()
        button.setTitle("Brown", for: .normal)
        button.configuration = .filled()
        button.backgroundColor = .brown
        button.tintColor = .brown
        button.addTarget(self, action: #selector(changeBackground(button: )), for: .touchUpInside)
        return button
    }()
    
    var delegate: changeColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addViews()
        setup()
    }
    
    //MARK: Methods
    func setup() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        upperLabel.translatesAutoresizingMaskIntoConstraints = false
        lowerLabel.translatesAutoresizingMaskIntoConstraints = false
        upperHStackView.translatesAutoresizingMaskIntoConstraints = false
        upperVStackView1.translatesAutoresizingMaskIntoConstraints = false
        upperVStackView2.translatesAutoresizingMaskIntoConstraints = false
        lowerHStackView.translatesAutoresizingMaskIntoConstraints = false
        lowerVStackView1.translatesAutoresizingMaskIntoConstraints = false
        lowerVStackView2.translatesAutoresizingMaskIntoConstraints = false
        color1.translatesAutoresizingMaskIntoConstraints = false
        color2.translatesAutoresizingMaskIntoConstraints = false
        color3.translatesAutoresizingMaskIntoConstraints = false
        color4.translatesAutoresizingMaskIntoConstraints = false
        color5.translatesAutoresizingMaskIntoConstraints = false
        color6.translatesAutoresizingMaskIntoConstraints = false
        background1.translatesAutoresizingMaskIntoConstraints = false
        background2.translatesAutoresizingMaskIntoConstraints = false
        background3.translatesAutoresizingMaskIntoConstraints = false
        background4.translatesAutoresizingMaskIntoConstraints = false
        background5.translatesAutoresizingMaskIntoConstraints = false
        background6.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            
            upperLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1),
            lowerLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1),
            upperHStackView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.4),
            lowerHStackView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.4),
            
        ])
    }
    
    func addViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(upperLabel)
        stackView.addArrangedSubview(upperHStackView)
        stackView.addArrangedSubview(lowerLabel)
        stackView.addArrangedSubview(lowerHStackView)
        upperHStackView.addArrangedSubview(upperVStackView1)
        upperHStackView.addArrangedSubview(upperVStackView2)
        
        upperVStackView1.addArrangedSubview(color1)
        upperVStackView1.addArrangedSubview(color2)
        upperVStackView1.addArrangedSubview(color3)
        upperVStackView2.addArrangedSubview(color4)
        upperVStackView2.addArrangedSubview(color5)
        upperVStackView2.addArrangedSubview(color6)
        
        lowerVStackView1.addArrangedSubview(background1)
        lowerVStackView1.addArrangedSubview(background2)
        lowerVStackView1.addArrangedSubview(background3)
        lowerVStackView2.addArrangedSubview(background4)
        lowerVStackView2.addArrangedSubview(background5)
        lowerVStackView2.addArrangedSubview(background6)
        
        lowerHStackView.addArrangedSubview(lowerVStackView1)
        lowerHStackView.addArrangedSubview(lowerVStackView2)
    }
    
    @objc func changeColors(button: UIButton) {
        delegate?.changeButton(color: button.tintColor)
    }
    
    @objc func changeBackground(button: UIButton) {
        delegate?.changeBackground(color: button.tintColor)
    }
}

protocol changeColor {
    func changeButton(color: UIColor)
    func changeBackground(color: UIColor)
}
