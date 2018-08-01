//
//  UIViewController+NavigationBar.swift
//  Cinema
//
//  Created by Beknar Danabek on 01/08/2018.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

extension UIViewController {
    func setLargeTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }

    func setNavigationBarTransparentBackground() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }

}
