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
    let icon: UIImage
    let title: String
    let controller: UIViewController
}

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    private var tabBarItems: [TabBarItem] = []

    override func viewDidLoad() {
        self.delegate = self
        self.tabBarItems = generateTabBarItems()
        viewControllers = self.tabBarItems.compactMap { $0.controller }
        configureTabBar()
        configureTabBarItems()
    }

    fileprivate func generateTabBarItems() -> [TabBarItem] {
        let homeNavigationController = UINavigationController(rootViewController: HomeViewController())
        let listNavigationController = UINavigationController(rootViewController: ListViewController())
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController())

        return [
            TabBarItem(icon: #imageLiteral(resourceName: "home"), title: "Home", controller: homeNavigationController),
            TabBarItem(icon: #imageLiteral(resourceName: "list"), title: "List", controller: listNavigationController),
            TabBarItem(icon: #imageLiteral(resourceName: "settings"), title: "Settings", controller: settingsViewController)
        ]
    }

    fileprivate func configureTabBarItems() {
        for (index, item) in self.tabBarItems.enumerated() {
            setUpTabBarItem(tabBar.items![index],
                            image: item.icon,
                            title: item.title)
        }
    }

    fileprivate func configureTabBar() {
        tabBar.barTintColor = .primary
        tabBar.tintColor = .secondary
        tabBar.isTranslucent = false
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.4
    }

    fileprivate func setUpTabBarItem(_ tabBarItem: UITabBarItem?, image: UIImage?, title: String?) {
        tabBarItem?.image = image
        tabBarItem?.title = title
    }

}
