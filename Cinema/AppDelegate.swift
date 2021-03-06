//
//  AppDelegate.swift
//  Cinema
//
//  Created by mac on 7/31/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK: - UIApplicationDelegate
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureInjection()
        configureWindow()
        return true
    }

    // MARK: - Window Setup
    fileprivate func configureWindow() {
        let tabBar = TabBarController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Injection Setup
    fileprivate func configureInjection() {
        #if DEBUG
        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
        #endif
    }
}
