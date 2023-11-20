//
//  TabBarController.swift
//  მოდულარობა
//
//  Created by David on 11/20/23.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        setupVC()
    }
    
    private func setupVC() {
        let mainVC = FactsViewController()
        
        mainVC.tabBarItem.image = UIImage(systemName: "cat")
        mainVC.tabBarItem.title = "Facts"
        
        let breedsVC = BreedsViewController()
        
        breedsVC.tabBarItem.image = UIImage(systemName: "pawprint")
        breedsVC.tabBarItem.title = "Breeds"
        
        let nav1 = UINavigationController(rootViewController: mainVC)
        let nav2 = UINavigationController(rootViewController: breedsVC)
        
        tabBar.tintColor = .black
        setViewControllers([nav1, nav2], animated: true)
    }
}
