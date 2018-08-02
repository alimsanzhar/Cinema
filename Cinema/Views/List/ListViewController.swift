//
//  ListViewController.swift
//  Cinema
//
//  Created by Beknar Danabek on 01/08/2018.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setPrimaryBackgroundColor()
        setLargeTitle()
        setNavigationBarTransparentBackground()
        title = Constants.List.TITLE
    }
}
