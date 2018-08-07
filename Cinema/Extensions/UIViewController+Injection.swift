//
//  UIViewController+Injection.swift
//  Cinema
//
//  Created by Beknar Danabek on 07/08/2018.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController { //5
    
    #if DEBUG //1
    @objc func injected() { //2
        for subview in self.view.subviews { //3
            subview.removeFromSuperview()
        }
        
        viewDidLoad() //4
    }
    #endif
}
