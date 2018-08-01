//
//  ContentViewController.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class HomeContentViewController: UIViewController {
    var movies: [Movie]?
    init(_ movies: [Movie]) {
        super.init(nibName: nil, bundle: nil)
        self.movies = movies
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
