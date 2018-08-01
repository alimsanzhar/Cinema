//
//  ViewController.swift
//  Cinema
//
//  Created by mac on 7/31/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var stateViewController = ContentStateViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        add(stateViewController)
    }
    
    func loadMovies(){
        
    }
    
    private func render(_ movies: [Movie]) {
        let contentVC = HomeContentViewController(movies)
        stateViewController.transition(to: .render(contentVC))
    }
    
    private func render(_ error: Error) {
        stateViewController.transition(to: .failed(error))
    }
}

