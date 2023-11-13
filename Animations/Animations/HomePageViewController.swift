//
//  ViewController.swift
//  Animations
//
//  Created by David on 11/13/23.
//

import UIKit

final class HomePageViewController: UIViewController {
    
    //MARK: - Private Properties
    private let colorLayer = CAGradientLayer()
    private let startColor = [UIColor.purple.cgColor, UIColor.red.cgColor, UIColor.systemPink.cgColor]
    private let endColor = [UIColor.blue.cgColor, UIColor.systemTeal.cgColor, UIColor.cyan.cgColor]
    
    //MARK: - Private Views
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TBC IT Academy"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .cyan
        label.alpha = 1
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
    
    //MARK: - Private Methods
    private func setupMainView() {
        view.backgroundColor = .white
        gradientColor(colors: startColor)
        view.addSubview(mainLabel)
        setupConstraints()
        
        //Version 1:
        //fadeAnimation(label: mainLabel)
        //Version 2:
        zoomAndRotateAnimation(label: mainLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
    
    private func fadeAnimation(label: UILabel) {
        UIView.animate(withDuration: 2.0) {
            label.alpha = 1
            label.frame.origin.y -= 40
        } completion: { _ in
            UIView.animate(withDuration: 2.0) {
                label.alpha = 0
                label.frame.origin.y += 40
            } completion: { [weak self] _ in
                self?.fadeAnimation(label: label)
            }
        }
    }
    
    private func rotateAnimation(label: UILabel) {
        UIView.animate(withDuration: 2.0) { [weak self] in
            label.transform = label.transform.rotated(by: (.pi) - 0.001)
            self?.colorLayer.colors = self?.endColor
        } completion: { [weak self] _ in
            UIView.animate(withDuration: 2.0) {
                label.transform = .identity
                self?.colorLayer.colors = self?.startColor
            } completion: { [weak self] _ in
                self?.rotateAnimation(label: label)
            }
        }
    }
    
    private func zoomAndRotateAnimation(label: UILabel) {
        label.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 2.0) {
            label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } completion: { [weak self] _ in
            self?.rotateAnimation(label: label)
        }
        
    }
    
    private func gradientColor(colors: [CGColor]) {
        colorLayer.frame = view.bounds
        colorLayer.colors = colors
        view.layer.addSublayer(colorLayer)
    }
}
