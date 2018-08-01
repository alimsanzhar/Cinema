//
//  TabBarController.swift
//  Cinema
//
//  Created by Beknar Danabek on 01/08/2018.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation
import UIKit

struct TabBarItem {
    var icon: UIImage?
    var controller: UIViewController
}

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var tabBarItems: [TabBarItem] = []
    
    override func viewDidLoad() {
        self.delegate = self
        self.tabBarItems = generateTabBarItems()
        viewControllers = self.tabBarItems.compactMap { $0.controller }
        configureTabBarItems()
        self.tabBar.tintColor = Colors.SECONDARY
    }

    fileprivate func generateTabBarItems() -> [TabBarItem] {
        let homeNavigationController = UINavigationController(rootViewController: HomeViewController())
        let listNavigationController = UINavigationController(rootViewController: ListViewController())
        let settingsViewController = SettingsViewController()
        return [
            TabBarItem(icon: #imageLiteral(resourceName: "home"), controller: homeNavigationController),
            TabBarItem(icon: #imageLiteral(resourceName: "list"), controller: listNavigationController),
            TabBarItem(icon: #imageLiteral(resourceName: "settings"), controller: settingsViewController)
        ]
    }

    fileprivate func configureTabBarItems() {
        for (index, item) in self.tabBarItems.enumerated() {
            setUpTabBarItem(tabBar.items![index],
                            image: item.icon)
        }
    }

    fileprivate func setUpTabBarItem(_ tabBarItem: UITabBarItem?, image: UIImage?) {
        tabBarItem?.image = image
        tabBarItem?.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }

}
