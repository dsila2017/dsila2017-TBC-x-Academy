//
//  AddNewItemToListViewController.swift
//  UITableView
//
//  Created by David on 10/30/23.
//

import UIKit

class AddNewItemToListViewController: UIViewController {
    
    //MARK: Views
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, textField, HstackView, chooseButton, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var HstackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [photoLabel, imageView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter song name"
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x:0, y:0, width:10, height:0))
        return textField
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Song name:"
        return label
    }()
    
    private let photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Photo:"
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        //image.image = .init(systemName: "photo.badge.plus")
        image.tintColor = .black
        return image
    }()
    
    private let chooseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose", for: .normal)
        button.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        button.configuration = .filled()
        button.tintColor = .black
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
        button.configuration = .filled()
        button.tintColor = .black
        return button
    }()
    
    var delegate: addItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    
    //MARK: Methods
    private func setupView() {
        
        view.addSubview(stackView)
        viewConstraints()
    }
    
    private func viewConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            HstackView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.4),
            
        ])
    }
    
    @objc func chooseImage() {
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        self.present(image, animated: true)
    }
    
    @objc func saveImage() {
        if textField.text?.isEmpty == false && imageView.image != nil {
            delegate?.addItem(music: Music(name: textField.text!, image: imageView.image))
            self.navigationController?.popViewController(animated: true)
        } else {
            alert()
        }
    }
}

extension AddNewItemToListViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
}

extension UIView {
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

extension AddNewItemToListViewController {
    
    func alert() {
        let alert = UIAlertController(title: "Error", message: "Please enter song name and choose a photo", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}
